package com.demo.helpers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadHelper {

	public static String upload(MultipartFile multipartFile, ServletContext servletContext) {
		try {
			String fileName = generateFileName(multipartFile.getOriginalFilename());
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/thumbnail/playlist/" + fileName));
			Files.write(path, bytes);
			return fileName;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	private static String generateFileName(String fileName) {
		String name = UUID.randomUUID().toString().replace("-", "");
		int index = fileName.lastIndexOf(".");
		String ext = fileName.substring(index);
		return name + ext;
	}
	
}
