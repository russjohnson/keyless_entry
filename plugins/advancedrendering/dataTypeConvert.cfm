<cfscript>
	/**
	* Generates an XMLDoc object from a basic CF Query.
	* 
	* @param query      The query to transform. (Required)
	* @param rootElement      Name of the root node. (Default is "query.") (Optional)
	* @param row      Name of each row. Default is "row." (Optional)
	* @param nodeMode      Defines the structure of the resulting XML. Options are 1) "values" (default), which makes each value of each column mlText of individual nodes; 2) "columns", which makes each value of each column an attribute of a node for that column; 3) "rows", which makes each row a node, with the column names as attributes. (Optional)
	* @return Returns a string. 
	* @author Nathan Dintenfass (nathan@changemedia.com) 
	* @version 2, November 15, 2002 
	*/
	function queryToXML(query){
	    //the default name of the root element
	    var root = "query";
	    //the default name of each row
	    var row = "row";
	    //make an array of the columns for looping
	    var cols = listToArray(query.columnList);
	    //which mode will we use?
	    var nodeMode = "values";
	    //vars for iterating
	    var ii = 1;
	    var rr = 1;
	    //vars for holding the values of the current column and value
	    var thisColumn = "";
	    var thisValue = "";
	    //a new xmlDoc
	    var xml = xmlNew();
	    //if there are 2 arguments, the second one is name of the root element
	    if(structCount(arguments) GTE 2)
	        root = arguments[2];
	    //if there are 3 arguments, the third one is the name each element
	    if(structCount(arguments) GTE 3)
	        row = arguments[3];        
	    //if there is a 4th argument, it's the nodeMode
	    if(structCount(arguments) GTE 4)
	        nodeMode = arguments[4];     
	    //create the root node
	    xml.xmlRoot = xmlElemNew(xml,root);
	    //capture basic info in attributes of the root node
	    xml[root].xmlAttributes["columns"] = arrayLen(cols);
	    xml[root].xmlAttributes["rows"] = query.recordCount;
	    //loop over the recordcount of the query and add a row for each one
	    for(rr = 1; rr LTE query.recordCount; rr = rr + 1){
	        arrayAppend(xml[root].xmlChildren,xmlElemNew(xml,row)); 
	        //loop over the columns, populating the values of this row
	        for(ii = 1; ii LTE arrayLen(cols); ii = ii + 1){
	            thisColumn = lcase(cols[ii]);
	            thisValue = query[cols[ii]][rr];
	            switch(nodeMode){
	                case "rows":
	                    xml[root][row][rr].xmlAttributes[thisColumn] = thisValue;
	                    break;
	                case "columns":
	                    arrayAppend(xml[root][row][rr].xmlChildren,xmlElemNew(xml,thisColumn)); 
	                    xml[root][row][rr][thisColumn].xmlAttributes["value"] = thisValue;
	                    break;
	                default:
	                    arrayAppend(xml[root][row][rr].xmlChildren,xmlElemNew(xml,thisColumn)); 
	                    xml[root][row][rr][thisColumn].xmlText = thisValue;                        
	            }
	
	        }
	    }
	    //return the xmlDoc
	    return xml;    
	}
</cfscript>