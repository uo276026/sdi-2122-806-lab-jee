
<html lang="en">
<head>
    <title>Servlets</title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<!-- Contenido -->
<div class="container" id="contenedor-principal">
    <h2>Listado de Productos</h2>
    <form action="GreetingServlet" method="get">
        <jsp:useBean id="productsServlet" class="com.uniovi.sdi.ServletProducts"/>
        <c:forEach var="product" begin="0" items="${storeProducts}">
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3">
                <div>
                    <img src="<c:out value="${product.image}"/>"/>
                    <div><c:out value="${product.name}"/></div>
                    <a href="AddToShoppingCart?product=<c:out value="${product.name}"/>"
                       class="btn btn-default">
                        <c:out value="${product.price}"/> €
                    </a>
                </div>
            </div>
        </c:forEach>
    </form>
</div>
</body>
</html>