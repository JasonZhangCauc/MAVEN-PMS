<?xml version="1.0"?>
<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <DocumentProperties xmlns="urn:schemas-microsoft-com:office:office">
  <Created>2006-09-16T00:00:00Z</Created>
  <LastSaved>2018-03-28T01:53:13Z</LastSaved>
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
  <Style ss:ID="s77">
   <Alignment ss:Horizontal="Center" ss:Vertical="Bottom"/>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="20" ss:Color="#000000"/>
  </Style>
  <Style ss:ID="s97">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="宋体" x:CharSet="134" ss:Size="14" ss:Color="#000000"/>
   <Interior ss:Color="#8DB4E2" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="s104">
   <Alignment ss:Horizontal="Left" ss:Vertical="Center"/>
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <NumberFormat ss:Format="@"/>
  </Style>
  <Style ss:ID="s105">
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
  <Table ss:ExpandedColumnCount="11" ss:ExpandedRowCount="100" x:FullColumns="1"
   x:FullRows="1" ss:DefaultColumnWidth="54" ss:DefaultRowHeight="13.5">
   <Column ss:AutoFitWidth="0" ss:Width="75.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="81"/>
   <Column ss:AutoFitWidth="0" ss:Width="76.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="68.25"/>
   <Column ss:AutoFitWidth="0" ss:Width="75.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="66.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="75"/>
   <Column ss:AutoFitWidth="0" ss:Width="75.75"/>
   <Column ss:AutoFitWidth="0" ss:Width="76.5"/>
   <Column ss:AutoFitWidth="0" ss:Width="108"/>
   <Column ss:AutoFitWidth="0" ss:Width="136.5"/>
   <Row ss:AutoFitHeight="0" ss:Height="27.75">
    <Cell ss:Index="4" ss:MergeAcross="5" ss:StyleID="s77"><Data ss:Type="String">其他成本信息</Data></Cell>
   </Row>
   <Row ss:AutoFitHeight="0" ss:Height="25.5">
    <Cell ss:StyleID="s97"><Data ss:Type="String">项目编号</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">项目名称</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">费用大项</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">费用小项</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">总金额</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">币种</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">开始日期</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">结束日期</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">报销人</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">费用说明</Data></Cell>
    <Cell ss:StyleID="s97"><Data ss:Type="String">备注</Data></Cell>
   </Row>
   <#if projectList?size!= 0>
		<#list projectList as projectVo>
			<#if projectVo.otherCostList?size!= 0>
				<#list projectVo.otherCostList as otherCostVo>
					<#if otherCostVo_index ==0>
						<Row>
					    <Cell ss:MergeDown="${projectVo.otherCostList?size-1}" ss:StyleID="s104"><Data ss:Type="String">${projectVo["PROJECT_NO"]!}</Data></Cell>
					    <Cell ss:MergeDown="${projectVo.otherCostList?size-1}" ss:StyleID="s104"><Data ss:Type="String">${projectVo["PROJECT_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["COST_SPORTS_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["COST_EVENTS_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["TOTAL_AMOUNT"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["CURRENCY"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["BEGIN_DATE"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["END_DATE"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["PEOPLE_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["COST_DESCRIBE"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["REMARK"]!}</Data></Cell>
					    </Row>
					</#if>
					<#if otherCostVo_index !=0>
						<Row>
						<Cell ss:Index="3" ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["COST_SPORTS_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["COST_EVENTS_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["TOTAL_AMOUNT"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["CURRENCY"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["BEGIN_DATE"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["END_DATE"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["PEOPLE_NAME"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["COST_DESCRIBE"]!}</Data></Cell>
					    <Cell ss:StyleID="s105"><Data ss:Type="String">${otherCostVo["REMARK"]!}</Data></Cell>
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
     <ActiveRow>6</ActiveRow>
     <ActiveCol>6</ActiveCol>
    </Pane>
   </Panes>
   <ProtectObjects>False</ProtectObjects>
   <ProtectScenarios>False</ProtectScenarios>
  </WorksheetOptions>
 </Worksheet>
</Workbook>