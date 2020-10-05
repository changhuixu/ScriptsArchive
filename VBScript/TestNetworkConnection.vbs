Sub Main()
  URL = "https://google.com/"
  PROXY = ""
  Wscript.Echo "Connecting " + URL
  Set objXMLHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0")
  If PROXY <> "" Then
    objXMLHTTP.setProxy 2, PROXY, ""
  End If
  objXMLHTTP.Open "GET", URL, false
  objXMLHTTP.send
  Wscript.Echo objXMLHTTP.responseText
  Wscript.Echo objXMLHTTP.Status
End Sub

Call Main

// works on Windows 10
