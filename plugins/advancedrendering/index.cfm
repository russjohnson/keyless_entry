<h1>Advanced Rendering</h1>
<p>This plugin adds a two (2) render options for your Controllers as well as one (1) UDF to convert from a Query to XML.</p>

<h2>Methods Added</h2>
<p>Here is a listing of the methods that are added by this plugin.</p>

<ul>
	<li>requestFormat</li>
	<li>queryToXML</li>
	<li>renderJSON</li>
	<li>renderXML</li>
</ul>

<h2>Example</h2>
<p>To test the plugin use the sample <tt>index</tt> action below and run any of this three paths:</p>

<ul>
	<li><tt>yourapp.com/users/?format=xml</tt></li>
	<li><tt>yourapp.com/users/?format=json</tt></li>
	<li><tt>yourapp.com/users/</tt></li>
</ul>

<blockquote>
	<tt>
	    &lt;!--- users/index ---&gt;<br />
	    &lt;cffunction name=&quot;index&quot;&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&lt;cfset users = model(&quot;User&quot;).findAll()&gt;<br />
	    <br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&lt;!--- How to render the request? ---&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&lt;cfswitch expression=&quot;#requestFormat()#&quot;&gt; <br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--- Render in JSON ---&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfcase value=&quot;json&quot;&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfset renderJSON(users)&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;cfbreak&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/cfcase&gt;<br />
	    <br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--- Render in XML ---&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfcase value=&quot;xml&quot;&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfset renderXML(users)&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfbreak&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;/cfcase&gt;<br />
	    <br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;!--- Render in CFML ---&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfdefaultcase&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&lt;cfbreak&gt;<br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &lt;/cfdefaultcase&gt; <br />
	    &nbsp;&nbsp;&nbsp;&nbsp;&lt;/cfswitch&gt;<br />
	    &lt;/cffunction&gt;
	</tt>
</blockquote>

<p><a href="<cfoutput>#cgi.http_referer#</cfoutput>"><<< Go Back</a></p>