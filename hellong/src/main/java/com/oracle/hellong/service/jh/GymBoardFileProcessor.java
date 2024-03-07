package com.oracle.hellong.service.jh;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.hellong.dao.jhdao.GymBoardFileDao;
import com.oracle.hellong.model.Gym;
import com.oracle.hellong.model.GymBoardFile;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GymBoardFileProcessor {

	private final GymBoardFileDao gbfd;

	public void processFile(MultipartFile gymboardFile, Gym gym, GymBoardFileAction action) throws IOException {
		String originalFilename = gymboardFile.getOriginalFilename();
		UUID uid = UUID.randomUUID();
		String storedFileName = uid + "-" + originalFilename;
		GymBoardFile gymBoardFile = new GymBoardFile();
		gymBoardFile.setGbf_originalFileName(originalFilename);
		gymBoardFile.setGbf_storedFileName(storedFileName);
		gymBoardFile.setG_id(gym.getG_id());

		// 백업 폴더가 없으면 생성
		String backupFolderPath = "C:/backup/";
		File backupFolder = new File(backupFolderPath);
		if (!backupFolder.exists()) {
			try {
				Files.createDirectories(Paths.get(backupFolderPath));
			} catch (IOException e) {
				
				e.printStackTrace();
				
			}
		}

		String savePath = backupFolderPath + storedFileName;
		gymboardFile.transferTo(new File(savePath));

		if (action == GymBoardFileAction.SAVE)
			gbfd.saveGymFile(gymBoardFile);
		else if (action == GymBoardFileAction.UPDATE)
			gbfd.saveGymFile(gymBoardFile);
	}

	public enum GymBoardFileAction {
		SAVE, UPDATE
	}

	public void deleteFileAndRecord(int g_id) throws IOException {
		List<GymBoardFile> filesToDelete = gbfd.getFilesByGymId(g_id);
		System.out.println(filesToDelete);
		for (GymBoardFile fileToDelete : filesToDelete) {
			String filePath = "/C:/backup/" + fileToDelete.getGbf_storedFileName();
			File file = new File(filePath);
			if (file.exists()) {
				if (file.delete()) {
					System.out.println("File deleted successfully.");
				} else {
					System.out.println("Failed to delete file.");
				}
			} else {
				System.out.println("File not found.");
			}
		}
		gbfd.deleteGymFile(g_id);
	}

}
