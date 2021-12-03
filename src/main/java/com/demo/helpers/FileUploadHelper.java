package com.demo.helpers;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadHelper {

	public static String uploadImage(MultipartFile multipartFile, ServletContext servletContext) {
		try {
			String fileName = generateFileName(multipartFile.getOriginalFilename());
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/playlist/" + fileName));
			Files.write(path, bytes);
			return fileName;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	

	public static String uploadImageAccount(MultipartFile multipartFile, ServletContext servletContext) {
		try {
			String fileName = generateFileName(multipartFile.getOriginalFilename());
			byte[] bytes = multipartFile.getBytes();
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/artist/" + fileName));
			Files.write(path, bytes);
			return fileName;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	public static boolean deleteImage(String fileName, ServletContext servletContext) {
		try {
			Path path = Paths.get(servletContext.getRealPath("/uploads/images/playlist/" + fileName));
			Files.delete(path);
			return true;
		}catch(Exception e){
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	private static String generateFileName(String fileName) {
		String name = UUID.randomUUID().toString().replace("-", "");
		int index = fileName.lastIndexOf(".");
		String ext = fileName.substring(index);
		return name + ext;
	}
	
}