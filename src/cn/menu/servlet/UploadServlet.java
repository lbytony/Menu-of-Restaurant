package cn.menu.servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.menu.db.util.R;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet(name = "UploadServlet", urlPatterns = { "/UploadServlet" })
public class UploadServlet extends HttpServlet {

	private static final long serialVersionUID = -2120102044390024438L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json;charset=utf-8");
		// 获取转进来的id
		String id = UUID.randomUUID().toString();
		// 获取本地路径
		String savePath = this.getServletConfig().getServletContext().getRealPath("");
		savePath += "images\\";
		File file = new File(savePath);
		// 判断是否存在 不存在就创建
		if (!file.exists()) {
			file.mkdirs();
		}
		System.out.println(savePath);
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("utf-8");
		List<FileItem> filelist = null;
		try {
			filelist = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			return;
		}
		Iterator<FileItem> it = filelist.iterator();
		String name = "";
		String extName = "";
		while (it.hasNext()) {
			FileItem item = it.next();
			if (!item.isFormField()) {
				name = item.getName();
				item.getSize();
				item.getContentType();
				// 判断是否为空
				if (name == null || name.trim().equals("")) {
					continue;
				}
				if (name.lastIndexOf(".") >= 0) {
					extName = name.substring(name.lastIndexOf("."));
				}

				File files = null;
				name = id;
				files = new File(savePath + name + extName);
				try {
					item.write(files);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		R r = new R();
		r.setCode(0);
		r.setMsg("上传成功");
		Map<String, String> data = new HashMap<String, String>();
		data.put("src", "images/" + name + extName);
		data.put("name", name + extName);
		r.setData(data);
		response.getWriter().print(r.toJson());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		getServletContext().getRequestDispatcher("/uploadmessage.jsp").forward(request, response);
	}

//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		// 检测是否为多媒体上传
//		if (!ServletFileUpload.isMultipartContent(request)) {
//			// 如果不是则停止
//			PrintWriter writer = response.getWriter();
//			writer.println("Error: 表单必须包含 enctype=multipart/form-data");
//			writer.flush();
//			return;
//		}
//
//		// 配置上传参数
//		DiskFileItemFactory factory = new DiskFileItemFactory();
//		// 设置内存临界值 - 超过后将产生临时文件并存储于临时目录中
//		factory.setSizeThreshold(MEMORY_THRESHOLD);
//		// 设置临时存储目录
//		factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
//
//		ServletFileUpload upload = new ServletFileUpload(factory);
//
//		// 设置最大文件上传值
//		upload.setFileSizeMax(MAX_FILE_SIZE);
//
//		// 设置最大请求值 (包含文件和表单数据)
//		upload.setSizeMax(MAX_REQUEST_SIZE);
//
//		// 中文处理
//		upload.setHeaderEncoding("UTF-8");
//
//		// 构造临时路径来存储上传的文件
//		// 这个路径相对当前应用的目录
//		String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIRECTORY;
//
//		// 如果目录不存在则创建
//		File uploadDir = new File(uploadPath);
//		if (!uploadDir.exists()) {
//			uploadDir.mkdir();
//		}
//
//		try {
//			// 解析请求的内容提取文件数据
//			List<FileItem> formItems = upload.parseRequest((RequestContext) request);
//
//			if (formItems != null && formItems.size() > 0) {
//				// 迭代表单数据
//				for (FileItem item : formItems) {
//					// 处理不在表单中的字段
//					if (!item.isFormField()) {
//						String fileName = new File(item.getName()).getName();
//						String filePath = uploadPath + File.separator + fileName;
//						File storeFile = new File(filePath);
//						// 在控制台输出文件的上传路径
//						System.out.println(filePath);
//						// 保存文件到硬盘
//						item.write(storeFile);
//						request.setAttribute("message", "文件上传成功!");
//					}
//				}
//			}
//		} catch (Exception ex) {
//			request.setAttribute("message", "错误信息: " + ex.getMessage());
//		}
//		// 跳转到 message.jsp
//		getServletContext().getRequestDispatcher("/uploadmessage.jsp").forward(request, response);
//	}
}