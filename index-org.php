<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link href="../css/style1.css" type="text/css" rel="stylesheet" />

<title>RevHelper: Towards an Improvement of Code Review Comments using Code Element Recommendation </title>
<style type="text/css">
hl
{
 color:#0066FF;
 font-size:18px;
}
.important
{
 color:#FF0000;
 font-weight:bold;
}
body
{
margin-top:100px;
}


</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="1020" align="center">
<tr>
<td width="100">
<img src="img/revhelper.png" height="100" width="100" border="0" />
</td> 
<td><h1>RevHelper: Towards an Improvement of Code Review Comments using Code Element Recommendation </h1></td>
</tr>

<tr>
<td colspan="2">
<p align="justify" class="rounded2" >
<strong>Abstract:</strong> 
Although peer code review is widely adopted in both commercial and open source development, existing studies suggest that such code reviews often contain a significant amount of non-useful review comments. Unfortunately, to date, no tools or techniques exist that can provide automatic support in improving those non-useful comments.
In this paper, we propose a novel technique--RevHelper--that suggests relevant code elements for a non-useful review comment by mining relevant patches (i.e., code changes) and textual content of the comment. We first motivate our idea using an exploratory with 800 reviews comments from four commercial subject systems, which suggests that non-useful review comments significantly lacked relevant code elements. Experiments using 276 review comments (with ground truth) suggest that our technique can recommend relevant code elements for the review comments with 66% Top-10 accuracy which is promising according to related literature.
Comparison with two variants of a baseline technique validates our empirical findings and demonstrates the potential of our technique.
</p>
</td>
</tr>
<tr>
<td>
&nbsp;
<spacer></spacer>
</td>
</tr>
<tr>
<td colspan="2">
<h3>Exploratory Study</h3>
<strong>Code Review Comments</strong>: The comments below are used for our exploratory study:
<ul>
<li><a href="replication/CS-corpus.txt">CS</a></li>
<li><a href="replication/SM-corpus.txt">SM</a></li>
<li><a href="replication/MS-corpus.txt">MS</a></li>
<li><a href="replication/SR-corpus.txt">SR</a></li>
<li><a href="replication/corpus-useful.txt">All useful comments</a></li>
<li><a href="replication/corpus-non-useful.txt">All non-useful comments</a></li>
</ul>

<strong>Replication Tools</strong>: The required tools are attached to help replicate the findings of 3 RQs from the exploratory study:
<ul>
<li><strong>RQ1:</strong> <a href="replication/ca.usask.cs.text.readability.jar">Readability calculator library</a>
<div class="rounded2">
<pre>
ReadabilityGradeProvider rProvider = new ReadabilityGradeProvider(
					preprocessedComment);
double rgrade = rProvider.getAvgReadabilityGrade();
</pre>
</div>
</li>
<li><strong>RQ2:</strong> Regular expressions for code segment/element identification: `{3}[\\S+\\s+]+`{3}|`[\\S+]+`|`[\\S+\\s+]+`</li>
<li><strong>RQ3:</strong> Term entropy calculator</li>
</ul>

</td>
</tr>


<tr>
<td colspan="2">
<h3>Experimental Data</h3>
<hr />
<strong>Subject Systems (4)</strong>
<ul>
<li><a href="#">CS</a></li>
<li><a href="#">SM</a></li>
<li><a href="#">MS</a></li>
<li><a href="#">SR</a></li>
</ul>
</td>
</tr>
<tr>
<td colspan="2">
<h3>Prototype</h3>
<hr />
Work in progress.
<br />
</td>
</tr>


<tr>
<td colspan="2">&nbsp;</td>
</tr>
<tr>
<td colspan="2">
<p>
&copy; Masud Rahman, Computer Science, University of Saskatchewan, Canada.
</p>
</td>
</tr>

</table>
</body>
</html>
