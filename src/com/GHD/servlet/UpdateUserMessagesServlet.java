package com.GHD.servlet;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.GHD.dao.UserDao;
import com.GHD.dao.impl.UserDaoImpl;

public class UpdateUserMessagesServlet extends HttpServlet {
	protected String sex = null;
	protected String address = null;
	protected String userImg = null;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setHeader("Content-type", "text/html; charset=utf-8");
		String user = (String) request.getSession().getAttribute("user");
		userImg = (String) request.getSession().getAttribute("userImg");
		String userImgName = updateUserImg(request,response);
		UserDao userDao = new UserDaoImpl();
		if(userImgName!=null) {
			userDao.updateUserMessages(user, sex, address, "/goods/userImg/"+userImgName);
		}else {
			userDao.updateUserMessages(user, sex, address);
		}
		response.sendRedirect("UserMessagesServlet");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected String updateUserImg(HttpServletRequest request, HttpServletResponse response) {
		String newFilename = null;
		try {
			//��������
			//��������
			FileItemFactory factory = new DiskFileItemFactory();
			//��������������
			ServletFileUpload sfu = new ServletFileUpload(factory);
			//����request���󣬵õ��û���������е��������ݣ�����һ��List<FileItem>
			List<FileItem> parseRequest = sfu.parseRequest(request);
			
			for (FileItem fileItem : parseRequest) {
				if(fileItem.isFormField()) {//�����ݣ���ӡ
					if(fileItem.getFieldName().equals("sex")) {
						sex = fileItem.getString("UTF-8");
					}else {
						address = fileItem.getString("UTF-8");
					}
					System.out.println(fileItem.getFieldName()+":"+fileItem.getString("UTF-8"));
				} else {
					if(userImg.equals("1")) {
						//�ļ���������fileĿ¼��
						//����Ŀ¼
//						String webRootPath = request.getServletContext().getRealPath("/");
//						String dirPath = "goods\\img";
//						String savePath = webRootPath + dirPath;
						String savePath = "D:\\web\\goods\\userImg";
						String originalFilename = fileItem.getName();
						String extensionFilename = originalFilename.substring(originalFilename.lastIndexOf(".") + 1);
						newFilename = originalFilename.substring(0, originalFilename.lastIndexOf(".")) + "_"+UUID.randomUUID()+"."+extensionFilename;
						
						File file = new File(savePath);
						if(!file.exists() && !file.isDirectory()) {
							file.mkdirs();//�����ڸ�Ŀ¼�򴴽���Ŀ¼
						}
						file = new File(savePath,newFilename);
						fileItem.write(file);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return newFilename; 
	}
}
