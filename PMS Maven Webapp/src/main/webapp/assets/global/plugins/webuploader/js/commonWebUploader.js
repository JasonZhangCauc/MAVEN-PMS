// 使用命名空间。
(function(window) {

    // 如果需要在模态框中使用webuploader，那么必须先调用prepareModal，
    // 再调用initWebUploader。这样可以解决模态框中使用webuploader出现的BUG。
    // 例如prepareModal('#addProductModal')
    this.prepareModal = function(modalId) {
        var _$modal = $(modalId);
        _$modal.css('display', 'block');
        _$modal.addClass("webuploader-element-invisible");
        _$modal.on('show.bs.modal', function() {
            _$modal.removeClass("webuploader-element-invisible");
        });
    }

    // 返回一个webuploader实例。
    /**
     * @param _webUploaderId 插件对应ID 必输
     * @param _fileAddId 文件新增ID
     * @param _fileAddIdContinue 文件继续新增按钮 必输
     * @param _dataId 上传文件对应数据ID 必输
     * @param _pageType 上传文件对应功能编码 必输
     * @param _extensions 上传文件格式 非必输
     * @param _editFileId 编辑框对应ID
     */
    this.initWebUploader = function(opt) {  //前三个参数对应的是jsp页面的div的id，
        var $ = jQuery, // just in case. Make sure it's not an other library.

            $wrap = $(opt._webUploaderId),

            // 图片容器
            $queue = $('<ul class="filelist"></ul>')
                .appendTo($wrap.find('.queueList')),

            // 状态栏，包括进度和控制按钮
            $statusBar = $wrap.find('.statusBar'),

            // 文件总体选择信息。
            $info = $statusBar.find('.info'),

            // 上传按钮
            $upload = $wrap.find('.uploadBtn'),

            // 没选择文件之前的内容。
            $placeHolder = $wrap.find('.placeholder'),

            // 总体进度条
            $progress = $statusBar.find('.progress').hide(),

            // 添加的文件数量
            fileCount = 0,

            // 添加的文件总大小
            fileSize = 0,

            // 优化retina, 在retina下这个值是2
            ratio = window.devicePixelRatio || 1,

            // 缩略图大小
            //        thumbnailWidth = 110 * ratio,
            //        thumbnailHeight = 110 * ratio,
            thumbnailWidth = ratio,
            thumbnailHeight = ratio,

            // 可能有pedding, ready, uploading, confirm, done.
            state = 'pedding',

            // 所有文件的进度信息，key为file id
            percentages = {},

            // WebUploader实例
            wuploader;
        
        	$(opt._fileAddId).on('click',function(){
        		wuploader.refresh();
        	});
        	
        if ( !WebUploader.Uploader.support('flash') && WebUploader.browser.ie ) {
            // flash 安装了但是版本过低。
            if (flashVersion) {
                (function(container) {
                    window['expressinstallcallback'] = function( state ) {
                        switch(state) {
                            case 'Download.Cancelled':
                                alert('您取消了更新！');
                                break;

                            case 'Download.Failed':
                                alert('安装失败');
                                break;

                            default:
                                alert('安装已成功，请刷新！');
                                break;
                        }
                        delete window['expressinstallcallback'];
                    };

                    var swf = './expressInstall.swf';
                    // insert flash object
                    var html = '<object type="application/' +
                            'x-shockwave-flash" data="' +  swf + '" ';

                    if (WebUploader.browser.ie) {
                        html += 'classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" ';
                    }

                    html += 'width="100%" height="100%" style="outline:0">'  +
                        '<param name="movie" value="' + swf + '" />' +
                        '<param name="wmode" value="transparent" />' +
                        '<param name="allowscriptaccess" value="always" />' +
                    '</object>';

                    container.html(html);

                })($wrap);

            // 压根就没有安转。
            } else {
                $wrap.html('<a href="http://www.adobe.com/go/getflashplayer" target="_blank" border="0"><img alt="get flash player" src="http://www.adobe.com/macromedia/style_guide/images/160x41_Get_Flash_Player.jpg" /></a>');
            }

            return;
        } else if (!WebUploader.Uploader.support()) {
            alert( 'Web Uploader 不支持您的浏览器！');
            return;
        }

        // 实例化
        wuploader = WebUploader.create({
            pick: {
                id: opt._fileAddId,
                label: '点击选择文件'
            },
            formData: {
            	dataId:opt._dataId,
            	pageType:opt._pageType
            },
            dnd: '#dndArea',
            paste: '#uploader',
            swf: '../Uploader.swf',
            chunked: false,
            chunkSize: 1024 * 1024 *50,
            server:basePath+'/common/multiFile',
            method:'POST',
            auto:true,
            accept: {
                 extensions: opt._extensions?opt._extensions:"doc,docx,xls,xlsx,pdf,"+
         				"ppt,pptx,jpg,png,gif"
            },

            // 禁掉全局的拖拽功能。这样不会出现图片拖进页面的时候，把图片打开。
            disableGlobalDnd: true,
            fileNumLimit: 300,
            fileSizeLimit: 2000 * 1024 * 1024,    // 200 M
            fileSingleSizeLimit: 500 * 1024 * 1024    // 50 M
        });
        
        // 拖拽时不接受 js, txt 文件。
        wuploader.on( 'dndAccept', function( items ) {
            var denied = false,
                len = items.length,
                i = 0,
                // 修改js类型
                unAllowed = 'text/plain;application/javascript ';

            for ( ; i < len; i++ ) {
                // 如果在列表里面
                if ( ~unAllowed.indexOf( items[ i ].type ) ) {
                    denied = true;
                    break;
                }
            }

            return !denied;
        });

        // 添加“添加文件”的按钮，
        wuploader.addButton({
            id : opt._fileAddIdContinue,
            label : '继续添加'
        });

        // 当有文件添加进来时执行，负责view的创建
        function addFile(file) {
            var $li = $('<li id="' + file.id + '">' +
                    // '<p class="title">' + file.name + '</p>' +
                    '<p class="imgWrap"></p>' +
                    '<p class="progress"><span></span></p>' +
                    '</li>'),

                $btns = $('<div class="file-panel">' +
                    '<span class="cancel">删除</span></div>').appendTo($li),
                $prgress = $li.find('p.progress span'),
                $wrap = $li.find('p.imgWrap'),
                $info = $('<p class="error"></p>'),

                showError = function(code) {
                    switch (code) {
                    case 'exceed_size':
                        text = '文件大小超出';
                        break;

                    case 'interrupt':
                        text = '上传暂停';
                        break;

                    default:
                        text = '上传失败，请重试';
                        break;
                    }

                    $info.text(text).appendTo($li);
                };

            if (file.getStatus() === 'invalid') {
                showError(file.statusText);
            } else {
                // @todo lazyload
                $wrap.text('预览中');
                wuploader.makeThumb(file, function(error, src) {
                    if (error) {
                        $wrap.text('不能预览');
                        return;
                    }
                    var img = $('<a class="fancybox" data-fancybox-group="gallery' + opt._webUploaderId + '" data-fancybox-href="' + src + '"><img src="' + src + '"></a>');

                    $wrap.empty().append(img);
                }, thumbnailWidth, thumbnailHeight);

                percentages[file.id] = [ file.size, 0 ];
            }

            file.on('statuschange', function(cur, prev) {
                if (prev === 'progress') {
                    $prgress.hide().width(0);
                    $li.remove();
                    initEidtUploaderUI({
            			_editFileId:opt._editFileId,
            			_dataId:opt._dataId,
            			_pageType:opt._pageType
            			});
                    wuploader.removeFile(file);
                } else if (prev === 'queued') {
                    $li.off('mouseenter mouseleave');
                    $btns.remove();
                }

                // 成功
                if (cur === 'error' || cur === 'invalid') {
                    showError(file.statusText);
                    percentages[file.id][1] = 1;
                } else if (cur === 'interrupt') {
                    showError('interrupt');
                } else if (cur === 'queued') {
                    percentages[file.id][1] = 0;
                } else if (cur === 'progress') {
                    $info.remove();
                    $prgress.css('display', 'block');
                } else if (cur === 'complete') {
                    $li.append('<span class="success"></span>');
                }

                $li.removeClass('state-' + prev).addClass('state-' + cur);
            });

            $li.on('mouseenter', function() {
                $btns.stop().animate({
                    height : 30
                });
            });

            $li.on('mouseleave', function() {
                $btns.stop().animate({
                    height : 0
                });
            });

            $btns.on('click', 'span', function() {
                var index = $(this).index(),
                    deg;

                switch (index) {
                case 0:
                    wuploader.removeFile(file);
                    return;
                }

            });

            $li.appendTo($queue);
        }

        // 负责view的销毁
        function doRemoveFile(file) {
            delete percentages[file.id];
            // 不处理“进度”的更新。让调用方自己负责更新。   by tanzx 2017-08-01
            //updateTotalProgress();

            var $li = $('#' + file.id);
            // 当文件显示出来时，才做移除。
            if ($li) {
                $li.off().find('.file-panel').off().end().remove();
            }

        }

        function updateTotalProgress() {
            var loaded = 0,
                total = 0,
                spans = $progress.children(),
                percent;

            $.each(percentages, function(k, v) {
                total += v[0];
                loaded += v[0] * v[1];
            });

            percent = total ? loaded / total : 0;

            spans.eq(0).text(Math.round(percent * 100) + '%');
            spans.eq(1).css('width', Math.round(percent * 100) + '%');
        }

        function setState(val) {
            var file,
                stats;

            if (val === state) {
                return;
            }

            $upload && $upload.removeClass('state-' + state);
            $upload && $upload.addClass('state-' + val);
            state = val;

            switch (state) {
            case 'pedding':
                $placeHolder.removeClass('element-invisible');
                $queue.parent().removeClass('filled');
                $queue.hide();
                $statusBar.addClass('element-invisible');
                wuploader.refresh();
                break;

            case 'ready':
                $placeHolder.addClass('element-invisible');
                $upload && $upload.removeClass('disabled');
                $queue.parent().addClass('filled');
                $queue.show();
                $statusBar.removeClass('element-invisible');
                wuploader.refresh();
                break;

            case 'uploading':
                $progress.show();
                $upload && $upload.text('暂停上传');
                break;

            case 'paused':
                $progress.show();
                $upload && $upload.text('继续上传');
                break;

            case 'confirm':
                $progress.hide();
                $upload && $upload.text('开始上传').addClass('disabled');

                stats = wuploader.getStats();
                if (stats.successNum && !stats.uploadFailNum) {
                    setState('finish');
                    return;
                }
                break;
            case 'finish':
                stats = wuploader.getStats();
                if (stats.successNum) {
                    
                } else {
                    // 没有成功的图片，重设
                    state = 'done';
                    location.reload();
                }
                break;
            }

        }

        wuploader.onUploadProgress = function(file, percentage) {
            var $li = $('#' + file.id),
                $percent = $li.find('.progress span');

            $percent.css('width', percentage * 100 + '%');
            percentages[file.id][1] = percentage;
            updateTotalProgress();
        };

        wuploader.onFileQueued = function(file) {
            fileCount++;
            fileSize += file.size;

            if (fileCount === 1) {
                $placeHolder.addClass('element-invisible');
                $statusBar.show();
            }

            addFile(file);
            setState('ready');
            updateTotalProgress();
        };

        wuploader.onFileDequeued = function(file) {
            fileCount--;
            fileSize -= file.size;

            if (!fileCount) {
                setState('pedding');
            }

            doRemoveFile(file);
            updateTotalProgress();

        };

        // 添加Reset监听。by tanzx 2017-08-01
        // TODO reset不知道有没有问题。是否选择用destroy？
        wuploader.onReset = function() {
            fileCount = 0;
            fileSize = 0;

            setState('pedding');

            // 移除页面上的图片。
            $.each(wuploader.getFiles(), function(index, value) {
                doRemoveFile(value);
            });
            updateTotalProgress();

        };

        wuploader.on('all', function(type) {
            var stats;
            switch (type) {
            case 'uploadFinished':
                setState('confirm');
                break;

            case 'startUpload':
                setState('uploading');
                break;

            case 'stopUpload':
                setState('paused');
                break;

            }
        });

        wuploader.onError = function(code) {
            var text = '';
            if (code == 'F_DUPLICATE') {
                text = '文件重复！';
            } else {
                text = 'Error: ' + code;
            }
            alert(text);
        };

        $upload && $upload.on('click', function() {
            if ($(this).hasClass('disabled')) {
                return false;
            }
            if (state === 'ready') {
                wuploader.upload();
            } else if (state === 'paused') {
                wuploader.upload();
            } else if (state === 'uploading') {
                wuploader.stop();
            }
        });

        $info.on('click', '.retry', function() {
            wuploader.retry();
        });

        $info.on('click', '.ignore', function() {
            //执行忽略动作，重置
            wuploader.reset();
        });

        $upload && $upload.addClass('state-' + state);
        updateTotalProgress();

        // WebUploader实例
        return wuploader;
    };

    window.CommonWebUploader = this;
    
})(window);