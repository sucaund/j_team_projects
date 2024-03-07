package com.oracle.hellong.service.jh;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.hellong.model.Trainer;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TrainerFileProcessor {
		
	public Trainer processFile(MultipartFile trainerPhotoFile, Trainer trainer) throws IOException {
		String originalFilename = trainerPhotoFile.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		String storedFileName = uid + "-" + originalFilename;
		Trainer trPhotoFile = new Trainer();
		trPhotoFile.setG_id(trainer.getG_id());
		trPhotoFile.setT_name(trainer.getT_name());
		trPhotoFile.setT_gender(trainer.getT_gender());
		trPhotoFile.setT_age(trainer.getT_age());
		trPhotoFile.setT_regdate(trainer.getT_regdate());
		trPhotoFile.setT_tel(trainer.getT_tel());
		trPhotoFile.setT_address(trainer.getT_address());
		trPhotoFile.setT_sal(trainer.getT_sal());
		trPhotoFile.setT_matters(trainer.getT_matters());
		trPhotoFile.setT_email(trainer.getT_email());
		trPhotoFile.setT_qualifications(trainer.getT_qualifications());
		trPhotoFile.setT_experience(trainer.getT_experience());
		trPhotoFile.setT_photoname(originalFilename);
		trPhotoFile.setT_photostoredname(storedFileName);

		// 백업 폴더가 없으면 생성
		String backupFolderPath = "C:/trbackup/";
		File backupFolder = new File(backupFolderPath);
		if (!backupFolder.exists()) {
			try {
				Files.createDirectories(Paths.get(backupFolderPath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String savePath = backupFolderPath + storedFileName;
		trainerPhotoFile.transferTo(new File(savePath));
		
		return trPhotoFile;
	}
	
	
	
	/*
	 * public void deleteFileAndRecord(int t_id) throws IOException {
	 * List<GymBoardFile> filesToDelete = gbfd.getFilesByGymId(g_id);
	 * System.out.println(filesToDelete); for (GymBoardFile fileToDelete :
	 * filesToDelete) { String filePath = "/C:/backup/" +
	 * fileToDelete.getGbf_storedFileName(); File file = new File(filePath); if
	 * (file.exists()) { if (file.delete()) {
	 * System.out.println("File deleted successfully."); } else {
	 * System.out.println("Failed to delete file."); } } else {
	 * System.out.println("File not found."); } } }
	 */
	
		

}
