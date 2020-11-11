package delectfile;

import java.util.ArrayList;
import java.util.List;

import UserList.filelist;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		List<filelist> FileList=readfile.read();
		for(filelist a:FileList) {
			int id=a.getId();
			String title=a.getTitle();
			String txt=a.getTxt();
			String picture=a.getPicture();
			ArrayList<String> pictures=a.getPictures();
			System.out.println(id);
			System.out.println(title);
			System.out.println(picture);
			for(String msg:pictures) {
				System.out.println(msg);
			}
			System.out.println(txt+"\n");
		}
	}

}
