<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>2006-09-16T00:00:00Z</Created>
  <LastSaved>2018-03-28T02:48:57Z</LastSaved>
  <Version>15.00</Version>
 </DocumentProperties>
 <OfficeDocumentSettings xmlns="urn:schemas-microsoft-com:office:office">
  <AllowPNG/>
  <RemovePersonalInformation/>
 </OfficeDocumentSettings>
 <ExcelWorkbook xmlns="urn:schemas-microsoft-com:office:excel">
  <WindowHeight>8010</WindowHeight>
  <WindowWidth>14805</WindowWidth>
  <WindowTopX>240</WindowTopX>
  <WindowTopY>105</WindowTopY>
  <ProtectStructure>False</ProtectStructure>
  <ProtectWindows>False</ProtectWindows>
 </ExcelWorkbook>
 <Styles>
  <Style ss:ID="Default" ss:Name="Normal">
   <Alignment ss:Vertical="Bottom"/>
   <Borders/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="11" ss:Color="#000000"/>
   <Interior/>
   <NumberFormat/>
   <Protection/>
  </Style>
  <Style ss:ID="s70">
   <Alignment ss:Vertical="Bottom"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="16" ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s73">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="18" ss:Color="#000000"
    ss:Bold="1"/>
  </Style>
  <Style ss:ID="s83">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Interior ss:Color="#8DB4E2" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s84">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s85">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <NumberFormat ss:Format="@"/>
  </Style>
 </Styles>
 <Worksheet ss:Name="Sheet1">
  <Table ss:ExpandedColumnCount="7" ss:ExpandedRowCount="100" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="13.5">
   <Column ss:AutoFitWidth="0" ss:Width="73.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="79.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="69"/>
   <Column ss:AutoFitWidth="0" ss:Width="97.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="75.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="95.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="111.75"/>
   <Row ss:AutoFitHeight="0" ss:Height="27.75">
    <Cell ss:Index="3" ss:MergeAcross="2" ss:StyleID="s73"><Data ss:Type="String">工时统计信息</Data></Cell>
    <Cell ss:StyleID="s70"/>
    <Cell ss:StyleID="s70"/>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="18">
    <Cell ss:StyleID="s83"><Data ss:Type="String">项目编号</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="String">项目标题</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="String">工时类型</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="String">工时总数</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="String">涉及资源</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="String">开始日期</Data></Cell>
    <Cell ss:StyleID="s83"><Data ss:Type="String">结束日期</Data></Cell>
   </Row>
   <#if projectList?size!= 0>
		<#list projectList as projectVo>
			<#if projectVo.workHoursList?size!= 0>
				<#list projectVo.workHoursList as workhoursVo>
					<#if workhoursVo_index ==0>
						<Row>
					    <Cell ss:MergeDown="${projectVo.workHoursList?size-1}" ss:StyleID="s84"><Data ss:Type="String">${projectVo["PROJECT_NO"]!}</Data></Cell>
					    <Cell ss:MergeDown="${projectVo.workHoursList?size-1}" ss:StyleID="s84"><Data ss:Type="String">${projectVo["PROJECT_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["WORKING_TYPE"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["WORKING_HOURS"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["INVOLVING_RESOURCE"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["BEGIN_DATE"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["END_DATE"]!}</Data></Cell>
					   </Row>
					</#if>
					<#if workhoursVo_index !=0>
						<Row>
					    <Cell ss:Index="3" ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["WORKING_TYPE"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["WORKING_HOURS"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["INVOLVING_RESOURCE"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["BEGIN_DATE"]!}</Data></Cell>
					    <Cell ss:StyleID="s85"><Data ss:Type="String">${workhoursVo["END_DATE"]!}</Data></Cell>
					    </Row>
					</#if>
				</#list>
   			</#if>
		</#list>
   </#if>
  </Table>
  <WorksheetOptions xmlns="urn:schemas-microsoft-com:office:excel">
   <PageSetup>
    <Header x:Margin="0.3"/>
    <Footer x:Margin="0.3"/>
    <PageMargins x:Bottom="0.75" x:Left="0.7" x:Right="0.7" x:Top="0.75"/>
   </PageSetup>
   <Print>
    <ValidPrinterInfo/>
    <PaperSizeIndex>9</PaperSizeIndex>
    <HorizontalResolution>600</HorizontalResolution>
    <VerticalResolution>600</VerticalResolution>
   </Print>
   <Selected/>
   <Panes>
    <Pane>
     <Number>3</Number>
     <ActiveRow>8</ActiveRow>
     <ActiveCol>6</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>
