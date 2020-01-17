package com.inhatc.system.core.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
   
	 
	private static final Logger logger = LoggerFactory.getLogger(UploadFileUtils.class);

	private static Integer WIDTH_SIZE = 100;

	public static Integer getWIDTH_SIZE() {
		return WIDTH_SIZE;
	}

	public static void setWIDTH_SIZE(Integer wIDTH_SIZE) {
		WIDTH_SIZE = wIDTH_SIZE;
	}

	// 1.������ ���� ���(uploadPath), 2.���� ������ �̸�(originalName), 3.���� ������(byte[])
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		// �� 1. ������ ����
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		System.out.println(uploadPath);
		// �� 2. ��/��/��' ���� ����
	

		// �� 3. �������� ����
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		// �� 4. �̹��� �ϰ�� ����� �̹��� ���� �� url �ּҷ� ��ȯ
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		String uploadedFileName = null;

		if (MediaUtils.getMediaType(formatName) != null) {
			// �̹����� ��� ����� ���� �� �̹��� �̸� ��ȯ ( ���+�����+s_�̸�)
			uploadedFileName = makeThumbnail(uploadPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedName);
		}

		// ���� ��θ� -> url ��η� �����ؼ� ��ȯ
		return uploadedFileName;
	}

	 // ckeditor ���� ���ε� ���� ��ȯ �Ȱ��� ������� �ƴ� ���� �̹���
	 // 1.������ ���� ���(uploadPath), 2.���� ������ �̸�(originalName), 3.���� ������(byte[])
	 public static String ckuploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {

		// �� 1. ������ ����
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;

		// �� 2. ��/��/��' ���� ����
		

		// �� 3. �������� ����
		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);

		// �� 4. �̹��� ���� �� url �ּҷ� ��ȯ
		String uploadedFileName = makeIcon(uploadPath, savedName);

		// ���� ��θ� -> url ��η� �����ؼ� ��ȯ
		return uploadedFileName;
	}

	 
	 
	// �̹����� �ƴҰ�� ���� ���� ��θ� -> url ��η� �����ؼ� ��ȯ
	private static String makeIcon(String uploadPath, String savedName) {
		String iconName = uploadPath+ File.separator + savedName;
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

	

	// ����� �̹��� �����ϱ�
	// 1.���� ��� 2. ����� ���, 3. ���� �̸�
	private static String makeThumbnail(String uploadPath, String fileName) throws Exception {
		// ���� �����ϴ� �̹����� �޸𸮻� �̹����� �÷� ���δ�. �� �޸𸮿� �ε���Ų��.
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath, fileName));

		// �޸𸮻� �̹����� ������ ũ�⿡ �°� �����Ѵ�.
		BufferedImage destImage = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, WIDTH_SIZE);

		// ����� �̹��� �̸��� ���Ѵ�. ����� �̹����� �տ� s_ ���δ�.
		String thumbnailName = uploadPath + File.separator + "s_" + fileName;

		// ���� ����� ��ü�� �����Ѵ�.
		File newFile = new File(thumbnailName);

		// ����� ������ �� . ���� �߽����� �и��ؼ� .jpg, png, jpeg gif �� ���ڸ� �����Ѵ�.
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);

		// �������� ����� �̹����� �����Ѵ�.
		ImageIO.write(destImage, formatName.toUpperCase(), newFile);

		// ���� ����� �������ø� url �� ����� �����÷� �����ؼ� �ؼ� ��ȯ��Ų��.
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}

}