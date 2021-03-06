<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#categorieslist").val(${model.recipes.categoryID});
	$("#delete").click(function(){
		$.post("${pageContext.request.contextPath}/deleterecipe",{recipeID:$("#recipeid").val()},function(){
			window.location.href="\home";
		});
		window.alert("delete button");
	})
})


</script>
</head>
<body>
<form action="/elec5619Springapp/updaterecipe" method="post" enctype="multipart/form-data">
<input type="hidden" name="recipeID" value="${model.recipes.recipeID }" id="recipeid"/>
<table>
	<tr>
		<td>recipeName:</td>
		<td><input type="text" name="recipeName" value="${model.recipes.recipeName}"/></td>
		
	</tr>
	<tr>
		<td>cookTime:</td>
		<td><input type="text" name="cookTime" value="${model.recipes.cookTime}"/></td>
		
	</tr>
	<tr>
		<td>servepeopleno:</td>
		<td>
		<input type="text" name="servepeopleno" value="${model.recipes.servepeopleno}"/></td>		
	</tr>
	<tr>
		<td>tips:</td>
		<td><input type="text" name="tips" value="${model.recipes.tips}"/></td>
	</tr>
	<tr>
		<td>category:</td>
		<td>
		<form:select path="category" name="categoryID" id="categorieslist">
			<c:forEach items="${category}" var="category">
				<form:option value="${category.categoryID }" >  ${category.categoryName }</form:option>
			</c:forEach>
			</form:select></td>
	</tr>	
	<tr>
		<td>dish picture:</td>
		<td><input type="file" name="dish_img"/></td>
		<td><img src="/imgUrl/${model.recipes.dishImg }"/><input type="hidden" value="${model.recipes.dishImg }" name="origindishImg"/></td>
	</tr>
</table>
<c:forEach items="${model.ingredients }" var="ingredient">
	<input type="hidden" name="ingredientID" value="${ingredient.ingredientID }"/>
	<input type="text" name="ingredientName" value="${ingredient.ingredientName }"/>
	<input type="text" name="ingredientAmount" value="${ingredient.ingredientAmount }"/></br>
</c:forEach>
<c:forEach items="${model.steps }" var="step">
	<input type="hidden" name="stepsID" value="${step.stepsID }"/>
	<input type="text" name="stepid" value="${step.stepsno }"/>
	<input type="file" name="steppicture"/>
	<input type="text" name="description" value="${step.description }"/>
	<img src="/imgUrl/${step.stepImg }"/><input type="hidden" value="${step.stepImg }" name="originstepImg"/></br>
</c:forEach>
<input type="submit" value="update"/>
<input type="button" value="delete" id="delete"/>
</form>
</body>
</html>