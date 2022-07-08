function CreateMSXMLDocumentObject() {
   if (typeof (ActiveXObject) != "undefined") {
      var progIDs = [ "Msxml2.DOMDocument.6.0", 
            "Msxml2.DOMDocument.5.0",
            "Msxml2.DOMDocument.4.0", 
            "Msxml2.DOMDocument.3.0",
            "MSXML2.DOMDocument", 
            "MSXML.DOMDocument" ];
      for ( var i = 0; i < progIDs.length; i++) {
         try {
            return new ActiveXObject(progIDs[i]);
         } catch (e) {
         }
         ;
      }
   }
   return null;
}

function BuildXMLFromString(text) {
   var message = "";
   if (window.DOMParser) { // 모든 브라우저 및 IE 9버전 이후
      var parser = new DOMParser();
      try {
           xmlDoc = parser.parseFromString(text, "text/xml");
      } catch (e) {
           // 문서에 오류가 있거나 IE 9 이전 버젼일 경우 에러
         alert("XML 파싱 실패.");
         return false;
      }
      ;
   } else { // IE 9 버젼 이전
      xmlDoc = CreateMSXMLDocumentObject();
      xmlDoc.loadXML(text);
   }

   var errorMsg = null;
   if (xmlDoc.parseError && xmlDoc.parseError.errorCode != 0) {
      errorMsg = "XML Parsing Error: " + 
      xmlDoc.parseError.reason   + " at line " + 
      xmlDoc.parseError.line + " at position "
      + xmlDoc.parseError.linepos;
   } else {
      if (xmlDoc.documentElement) {
   if (xmlDoc.documentElement.nodeName == "parsererror") {
   errorMsg = xmlDoc.documentElement.childNodes[0].nodeValue;
         }
      } else {
         errorMsg = "XML 파싱 에러!";
      }
   }

   if (errorMsg) {
      alert(errorMsg);
      return false;
   }
   // 여기 까지 오면 파싱 성공   
   return true;
}