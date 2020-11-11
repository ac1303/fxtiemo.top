package delectfile;
import java.util.ArrayList;
import java.util.List;
import UserList.filelist;
import java.io.*;
public class readfile {
	public static List<filelist> read(){
	  List<filelist> FileList=new ArrayList<filelist>();
	  String wx_list=configure.Configure.getPath();
//	  String wx_list="D:\\360\\wx\\list\\";
	  for(int i=0;i<=99;i++){
          File folder=new File(wx_list+i+"\\");
            if(!folder.exists()&&!folder.isDirectory()){
          }else{
        	  filelist a=new filelist();
        	  a.setId(i);
        	  a.setTitle(title(wx_list+i,i));
        	  a.setTxt(txt(wx_list+i,i));
        	  a.setPicture(picture(wx_list+i,i));
        	  a.setPictures(pictures(wx_list+i,i));
        	  FileList.add(a);
          }
	  }
	  return FileList;
	}
	
	public static ArrayList<String> pictures(String path,int i) {
		ArrayList<String> list = new ArrayList<String>();
		 File pic= new File(path+"\\pic\\");
		    if(pic.exists()&&pic.isDirectory()){
		    File[] pictures = pic.listFiles(); 
		      if (pictures.length > 0) {
		        for (File fileChildDir : pictures) {
		                if (fileChildDir.isFile()) {
		                if(fileChildDir.getName().endsWith(".jpg")){
		list.add("<button class='layui-btn' onclick=\"xadmin.open('ͼƬչʾ','./show_picture.jsp?url="+i+"/pic/"+fileChildDir.getName()+"',400,400)\">"+fileChildDir.getName()+"</button><br/>");        
		                  }
		                }
		            }
		       }else{
		       list.add("<button class='layui-btn' onclick=\"xadmin.open('ͼƬ���','./code_add_picture.jsp?id="+i+"',400,400)\">���ͼƬ</button>");
		       }
		    }else{
		    list.add("�ļ��в�����");
		    }
		return list;
	}
	
	public static String picture(String path,int i) {
		File picture=new File(path+"\\pic.jpg");
        if(!picture.exists()){
        	return "<button class='layui-btn' onclick=\"xadmin.open('ͼƬ���','./code_add_pic.jsp?id="+i+"',400,400)\">���</button>";
        }else{
     return "<button class='layui-btn' onclick=\"xadmin.open('ͼƬչʾ','./show_picture.jsp?url="+i+"/pic.jpg"+"',400,400)\">����ͼչʾ</button>";
      }
}
	
	public static String txt(String path,int i) {
		File title=new File(path+"\\txt.txt");
	  	  if(!title.exists()){
	            return "<button class='layui-btn' onclick=\"xadmin.open('�İ����','./code_add_txt.jsp?id="+i+"',400,400)\">����İ�</button>";
	            }else{
	           FileInputStream fr = null;
			try {
				fr = new FileInputStream(title);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	           BufferedReader brd = null;
			try {
				brd = new BufferedReader(new InputStreamReader(fr,"UTF-8"));
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				
			}
	           try {
				if(brd.ready())
				   {
				   String fileline = brd.readLine();
				   return fileline;
				   }else{
				   return "�ޱ���";
				   }
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				try {
					brd.close();
					fr.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
	          }    
			return "�������ļ���";
	}
	
	public static String title(String path,int i) {
		File title=new File(path+"\\title.txt");
  	  if(!title.exists()){
            return "<button class='layui-btn' onclick=\"xadmin.open('�������','./code_add_title.jsp?id="+i+"',400,400)\">��ӱ���</button>";
            }else{
           FileInputStream fr = null;
		try {
			fr = new FileInputStream(title);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
           BufferedReader brd = null;
		try {
			brd = new BufferedReader(new InputStreamReader(fr,"UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
		}
           try {
			if(brd.ready())
			   {
			   String fileline = brd.readLine();
			   return fileline;
			   }else{
			   return "�ޱ���";
			   }
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				brd.close();
				fr.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
          }    
		return "�������ļ���";
	}
}
