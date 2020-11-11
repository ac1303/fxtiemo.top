package delectfile;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

public class delect {
	public static void delectfile(String id) {
		try {
			String wx_list=configure.Configure.getPath();
			File file= new File(wx_list+id+"\\");
			FileUtils.deleteDirectory(file);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
