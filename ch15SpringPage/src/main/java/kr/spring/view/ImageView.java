package kr.spring.view;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.view.AbstractView;

@Component //bean의 이름과 클래스의 이름이 일치해야되는데 bean을 지정하지않아도 클래스 이름을 소문자로 바꿔서 넣어준다.
public class ImageView extends AbstractView{

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		byte[] file = (byte[])model.get("imageFile");
		String filename= (String)model.get("filename");
		
		String ext = filename.substring(filename.lastIndexOf(".")); //face.png: 확장자 앞에 .이 있기 때문에 .으로 구분하여 확장자 추출
		if(ext.equalsIgnoreCase(".gif")) { //확장자가 .GIF인 경우도 있어서 대소문자 구문 없이
			ext="image/gif";
		}else if(ext.equalsIgnoreCase(".png")){
			ext="image/png";
		}else {
			ext = "image/jpeg";
		}
		
		response.setContentType(ext);
		response.setContentLength(file.length);
		
		String file_name = new String(filename.getBytes("utf-8"),"iso-8859-1");
		
		response.setHeader("Content-Disposition","attachment; filename=\""+file_name+"\"");
		response.setHeader("Content-Transfer-Encoding","binary");
		
		OutputStream out = response.getOutputStream();
		InputStream input = null;
		try {
			input = new ByteArrayInputStream(file);
			IOUtils.copy(input, out);
			out.flush();
		}finally {
			if(out!=null)out.close();
			if(input!=null)input.close();
		}
	}

}
