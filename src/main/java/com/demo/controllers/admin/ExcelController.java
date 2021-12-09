package com.demo.controllers.admin;

import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.ServletContextAware;

import com.demo.entities.PackageInfo;
import com.demo.services.PackageInfoService;

@Controller
@RequestMapping(value = {"admin/excel"})
public class ExcelController implements ServletContextAware {

	private ServletContext servletContext;
	
	@Autowired
	private PackageInfoService packageInfoService;
	
	@RequestMapping(value = {"export" }, method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<Boolean> export() {
		boolean result = false;
		try {
			HSSFWorkbook workbook = new HSSFWorkbook();
			HSSFSheet sheet = workbook.createSheet("History Bill");
			List<PackageInfo> packageInfos = (List<PackageInfo>)packageInfoService.findAll();
			
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_(HH_mm_ss)");
			String currentDateTime = dateFormat.format(new Date());
			String fileName = "history_" + currentDateTime + ".xls";
			String location = servletContext.getRealPath("/export/" + fileName);
			
			// Tao tieu de
			Row heading = sheet.createRow(0);
			heading.createCell(0).setCellValue("Id");
			heading.createCell(1).setCellValue("Package Name");
			heading.createCell(2).setCellValue("Price");
			heading.createCell(3).setCellValue("Nickname");
			heading.createCell(4).setCellValue("Purchase Date");
			heading.createCell(5).setCellValue("Expriration Date");
			for (int i = 0; i < 6; i++) {
				CellStyle styleHeading = workbook.createCellStyle();
				Font font = workbook.createFont();
				font.setBold(true);
				font.setFontName(HSSFFont.FONT_ARIAL);
				font.setFontHeightInPoints((short) 11);
				styleHeading.setFont(font);
//				styleHeading.setVerticalAlignment(CellStyle.ALIGN_CENTER);
				heading.getCell(i).setCellStyle(styleHeading);
			}

			int rownum = 1;
			for (PackageInfo p : packageInfos) {
				Row row = sheet.createRow(rownum++);

				// Cot id
				Cell cellId = row.createCell(0);
				cellId.setCellValue(p.getId());

				// Cot package name
				Cell cellName = row.createCell(1);
				cellName.setCellValue(p.getServicePackage().getName());

				// Cot Price
				Cell cellPrice = row.createCell(2);
				cellPrice.setCellValue(p.getPrice());
				CellStyle stylePrice = workbook.createCellStyle();
				HSSFDataFormat cf = workbook.createDataFormat();
				stylePrice.setDataFormat(cf.getFormat("$#,##0.00"));
				cellPrice.setCellStyle(stylePrice);

				// Cot nickname
				Cell cellNickname = row.createCell(3);
				cellNickname.setCellValue(p.getAccount().getNickname());
				
				// Cot Purchase Date
				Cell cellPurchaseDate = row.createCell(4);
				cellPurchaseDate.setCellValue(p.getPurchaseDate());
				CellStyle stylePurchaseDate = workbook.createCellStyle();
				HSSFDataFormat dfPurchaseDate = workbook.createDataFormat();
				stylePurchaseDate.setDataFormat(dfPurchaseDate
						.getFormat("MM/dd/yyyy"));
				cellPurchaseDate.setCellStyle(stylePurchaseDate);
				
				// Cot Expiration Date
				Cell cellExpirationDate = row.createCell(5);
				cellExpirationDate.setCellValue(p.getExpirationDate());
				CellStyle styleExpirationDate = workbook.createCellStyle();
				HSSFDataFormat dfExpirationDate = workbook.createDataFormat();
				styleExpirationDate.setDataFormat(dfExpirationDate
						.getFormat("MM/dd/yyyy"));
				cellExpirationDate.setCellStyle(styleExpirationDate);

			}

			// Cot Total
//			Row row = sheet.createRow(packageInfos.size() + 1);
//			Cell cellTextTotal = row.createCell(1);
//			cellTextTotal.setCellValue("Total");
//			CellRangeAddress region = CellRangeAddress.valueOf("A5:E5");
//			sheet.addMergedRegion(region);
//			CellStyle styleTotal = workbook.createCellStyle();
////			styleTotal.setVerticalAlignment(CellStyle.ALIGN_RIGHT);
//			Font fontTextTotal = workbook.createFont();
//			fontTextTotal.setBold(true);
//			fontTextTotal.setFontHeightInPoints((short) 11);
////			fontTextTotal.setColor(HSSFColor.RED.index);
//			styleTotal.setFont(fontTextTotal);
////			styleTotal.setVerticalAlignment(CellStyle.ALIGN_RIGHT);
//			cellTextTotal.setCellStyle(styleTotal);

			// Tinh gia tri total
//			Cell cellTotalValue = row.createCell(2);
//			cellTotalValue.setCellFormula("sum(C2:"+ packageInfos.size() + 1 +")");
//			HSSFDataFormat dfTotalValue = workbook.createDataFormat();
//			CellStyle styleTotalValue = workbook.createCellStyle();
//			styleTotalValue.setDataFormat(dfTotalValue.getFormat("$#,##0.00"));
//			cellTotalValue.setCellStyle(styleTotalValue);

			// Autofit cac cot
			for (int i = 0; i < 6; i++)
				sheet.autoSizeColumn(i);

			// Luu xuong file excel
			FileOutputStream out = new FileOutputStream(new File(location));
			workbook.write(out);
			out.close();
			workbook.close();
			System.out.println("Excel written successfully..");
			result = true;
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		try {
			return new ResponseEntity<Boolean>(result, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<Boolean>(HttpStatus.BAD_REQUEST);
		}
	}

	@Override
	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
}
