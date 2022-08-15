<%-- 
    Document   : cart
    Created on : Mar 12, 2022, 9:11:13 AM
    Author     : 2
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />

        <title>Cửa hàng rau củ</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
    </head>
    <body>
        <%@include file="components/navBarComponents.jsp" %>
        <section class="py-5">
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <h3>Thủ thuật thanh toán</h3>
                        <table class="table table-hover">
                            <h3>Danh sách giỏ hàng</h3>
                            <c:if test="${sessionScope.carts.size()==0}">
                                <h1 style="color: blue">Bạn chưa mua gì cả ༼ つ ◕_◕ ༽つ</h1>

                            </c:if>
                            <c:if test="${sessionScope.carts.size()!=0}">

                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Ảnh</th>
                                        <th scope="col">Tên</th>
                                        <th scope="col">Giá</th>
                                        <th scope="col">Số lượng</th>
                                        <th scope="col">Tổng</th>
                                        <th scope="col">Thao tác</th>
                                    </tr>
                                </thead>
                            </c:if>
                            <tbody>
                                <c:forEach  items="${carts}" var="C">
                                <form action="update-quantity">

                                    <tr>
                                    <input type="hidden" name="productId" value="${C.value.product.productID}"/>
                                    <th scope="row">${C.value.product.productID}</th>
                                    <td><img src="${C.value.product.image}" width="50"/></td>
                                    <td>${C.value.product.productName}</td>
                                    <td>${C.value.product.price}</td>
                                    <td><input onchange="this.form.submit()" type="number" name ="quantity" value="${C.value.quantity}"/></td>
                                    <td>${C.value.quantity*C.value.product.price}</td>
                                    <td><a href="delete-cart?productID=${C.value.product.productID}" class="btn btn-outline-danger">Delete</a></td>
                                    </tr>
                                </form>    
                            </c:forEach>

                            </tbody>

                        </table>
                        <h3>Tổng tiền:$${totalMoney}</h3>
                        <a href="checkout" class="btn btn-success">Check out</a>
                    </div>
                    <div class="col-md-5">
                        <form action="checkout" method="POST">
                            <div class="mb-3">
                                <label for="name" class="form-label">Username</label>
                                <input type="text" class="form-control" id="name" name="fullName" aria-describedby="emailHelp">
                                
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="text" class="form-control" id="password" name="password" aria-describedby="emailHelp">
                                
                            </div>
                            <div class="mb-3">
                                <label for="address" class="form-label">Address</label>
                                <input type="text" class="form-control" id="address" name="adress" aria-describedby="emailHelp">
                                
                            </div>
                            <div class="mb-3">
                                <label for="phone" class="form-label">Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="emailHelp">
                                
                            </div>
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
