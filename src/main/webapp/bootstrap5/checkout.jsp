<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/Commons/taglib.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <title>Bookly - Bookstore eCommerce Website Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="author" content="">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap5/style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap" rel="stylesheet">
  </head>
  <body>
  
   
  	<%@ include file="/bootstrap5/svg.jsp" %>

	<%@ include file="/bootstrap5/header.jsp" %>

    <section class="checkout-wrap padding-large">
      <div class="container">
        <form class="form-group">
          <div class="row d-flex flex-wrap">
            <div class="col-lg-6">
              <h3 class="mb-3">Chi tiết đơn hàng</h3>
              <div class="billing-details">
                <label for="fname">Họ tên*</label>
                <input type="text" id="fname" name="firstname" class="form-control mt-2 mb-4 ps-3">
                <label for="provinces">Tỉnh/Thành phố:*</label>
			        <select id="provinces" name="provinces" class="form-control mt-2 mb-4 ps-3">
			            <option value="">-- Chọn tỉnh/thành phố --</option>
			            <c:forEach var="province" items="${provinces}">
			                <option value="${province}">${province}</option>
			            </c:forEach>
			        </select>
                <label for="cname">Quận/Huyện/Thị xã:*</label>
                <input type="text" id="cname" name="companyname" class="form-control mt-2 mb-4">
                <label for="address">Số nhà/Đường/Thôn/Ấp:*</label>
                <input type="text" id="adr" name="address" placeholder="House number and street name"
                  class="form-control mt-3 ps-3 mb-3">
                <input type="text" id="adr" name="address" placeholder="Appartments, suite, etc."
                  class="form-control ps-3 mb-4">
                <label for="city">Town / City *</label>
                <input type="text" id="city" name="city" class="form-control mt-3 ps-3 mb-4">
                <label for="state">State *</label>
                <select class="form-select form-control mt-2 mb-4" aria-label="Default select example">
                  <option selected="" hidden="">Florida</option>
                  <option value="1">New York</option>
                  <option value="2">Chicago</option>
                  <option value="3">Texas</option>
                  <option value="3">San Jose</option>
                  <option value="3">Houston</option>
                </select>
                <label for="zip">Zip Code *</label>
                <input type="text" id="zip" name="zip" class="form-control mt-2 mb-4 ps-3">
                <label for="email">Phone *</label>
                <input type="text" id="phone" name="phone" class="form-control mt-2 mb-4 ps-3">
                <label for="email">Email address *</label>
                <input type="text" id="email" name="email" class="form-control mt-2 mb-4 ps-3">
              </div>
            </div>
            <div class="col-lg-6">
              <div>
                <h3 class="mb-3">Additional Information</h3>
                <div class="billing-details">
                  <label for="fname">Order notes (optional)</label>
                  <textarea class="form-control pt-3 pb-3 ps-3 mt-2"
                    placeholder="Notes about your order. Like special notes for delivery."></textarea>
                </div>
              </div>

              <div class="cart-totals padding-medium pb-0">
                <h3 class="mb-3">Cart Totals</h3>
                <div class="total-price pb-3">
                  <table cellspacing="0" class="table text-capitalize">
                    <tbody>
                      <tr class="subtotal pt-2 pb-2 border-top border-bottom">
                        <th>Subtotal</th>
                        <td data-title="Subtotal">
                          <span class="price-amount amount text-primary ps-5 fw-light">
                            <bdi>
                              <span class="price-currency-symbol">$</span>2,400.00
                            </bdi>
                          </span>
                        </td>
                      </tr>
                      <tr class="order-total pt-2 pb-2 border-bottom">
                        <th>Total</th>
                        <td data-title="Total">
                          <span class="price-amount amount text-primary ps-5 fw-light">
                            <bdi>
                              <span class="price-currency-symbol">$</span>2,400.00</bdi>
                          </span>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="list-group">
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios1" value="" checked>
                    <span>
                      <p class="mb-1">Direct bank transfer</p>
                      <small>Make your payment directly into our bank account. Please use your Order ID. Your order will
                        shipped after funds have cleared in our account.</small>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios2" value="">
                    <span>
                      <p class="mb-1">Check payments</p>
                      <small>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store
                        Postcode.</small>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios3" value="">
                    <span>
                      <p class="mb-1">Cash on delivery</p>
                      <small>Pay with cash upon delivery.</small>
                    </span>
                  </label>
                  <label class="list-group-item d-flex gap-2 border-0">
                    <input class="form-check-input flex-shrink-0" type="radio" name="listGroupRadios"
                      id="listGroupRadios3" value="">
                    <span>
                      <p class="mb-1">Paypal</p>
                      <small>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</small>
                    </span>
                  </label>
                </div>
                <div class="button-wrap mt-3">
                  <button type="submit" name="submit" class="btn">Place an order</button>
                </div>
              </div>

            </div>

          </div>
        </form>
      </div>
    </section>

    <section id="instagram">
      <div class="container">
        <div class="text-center mb-4">
          <h3>Instagram</h3>
        </div>
        <div class="row">
          <div class="col-md-2">
            <figure class="instagram-item position-relative rounded-3">
              <a href="https://templatesjungle.com/" class="image-link position-relative">
                <div class="icon-overlay position-absolute d-flex justify-content-center">
                  <svg class="instagram">
                    <use xlink:href="#instagram"></use>
                  </svg>
                </div>
                <img src="images/insta-item1.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
              </a>
            </figure>
          </div>
          <div class="col-md-2">
            <figure class="instagram-item position-relative rounded-3">
              <a href="https://templatesjungle.com/" class="image-link position-relative">
                <div class="icon-overlay position-absolute d-flex justify-content-center">
                  <svg class="instagram">
                    <use xlink:href="#instagram"></use>
                  </svg>
                </div>
                <img src="images/insta-item2.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
              </a>
            </figure>
          </div>
          <div class="col-md-2">
            <figure class="instagram-item position-relative rounded-3">
              <a href="https://templatesjungle.com/" class="image-link position-relative">
                <div class="icon-overlay position-absolute d-flex justify-content-center">
                  <svg class="instagram">
                    <use xlink:href="#instagram"></use>
                  </svg>
                </div>
                <img src="images/insta-item3.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
              </a>
            </figure>
          </div>
          <div class="col-md-2">
            <figure class="instagram-item position-relative rounded-3">
              <a href="https://templatesjungle.com/" class="image-link position-relative">
                <div class="icon-overlay position-absolute d-flex justify-content-center">
                  <svg class="instagram">
                    <use xlink:href="#instagram"></use>
                  </svg>
                </div>
                <img src="images/insta-item4.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
              </a>
            </figure>
          </div>
          <div class="col-md-2">
            <figure class="instagram-item position-relative rounded-3">
              <a href="https://templatesjungle.com/" class="image-link position-relative">
                <div class="icon-overlay position-absolute d-flex justify-content-center">
                  <svg class="instagram">
                    <use xlink:href="#instagram"></use>
                  </svg>
                </div>
                <img src="images/insta-item5.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
              </a>
            </figure>
          </div>
          <div class="col-md-2">
            <figure class="instagram-item position-relative rounded-3">
              <a href="https://templatesjungle.com/" class="image-link position-relative">
                <div class="icon-overlay position-absolute d-flex justify-content-center">
                  <svg class="instagram">
                    <use xlink:href="#instagram"></use>
                  </svg>
                </div>
                <img src="images/insta-item6.jpg" alt="instagram" class="img-fluid rounded-3 insta-image">
              </a>
            </figure>
          </div>
        </div>
      </div>
    </section>

    <footer id="footer" class="padding-large">
      <div class="container">
        <div class="row">
          <div class="footer-top-area">
            <div class="row d-flex flex-wrap justify-content-between">
              <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu">
                  <img src="images/main-logo.png" alt="logo" class="img-fluid mb-2">
                  <p>Nisi, purus vitae, ultrices nunc. Sit ac sit suscipit hendrerit. Gravida massa volutpat aenean odio
                    erat nullam fringilla.</p>
                  <div class="social-links">
                    <ul class="d-flex list-unstyled">
                      <li>
                        <a href="#">
                          <svg class="facebook">
                            <use xlink:href="#facebook" />
                          </svg>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <svg class="instagram">
                            <use xlink:href="#instagram" />
                          </svg>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <svg class="twitter">
                            <use xlink:href="#twitter" />
                          </svg>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <svg class="linkedin">
                            <use xlink:href="#linkedin" />
                          </svg>
                        </a>
                      </li>
                      <li>
                        <a href="#">
                          <svg class="youtube">
                            <use xlink:href="#youtube" />
                          </svg>
                        </a>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="col-lg-2 col-sm-6 pb-3">
                <div class="footer-menu text-capitalize">
                  <h5 class="widget-title pb-2">Quick Links</h5>
                  <ul class="menu-list list-unstyled text-capitalize">
                    <li class="menu-item mb-1">
                      <a href="#">Home</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">About</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Shop</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Blogs</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Contact</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu text-capitalize">
                  <h5 class="widget-title pb-2">Help & Info Help</h5>
                  <ul class="menu-list list-unstyled">
                    <li class="menu-item mb-1">
                      <a href="#">Track Your Order</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Returns Policies</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Shipping + Delivery</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Contact Us</a>
                    </li>
                    <li class="menu-item mb-1">
                      <a href="#">Faqs</a>
                    </li>
                  </ul>
                </div>
              </div>
              <div class="col-lg-3 col-sm-6 pb-3">
                <div class="footer-menu contact-item">
                  <h5 class="widget-title text-capitalize pb-2">Contact Us</h5>
                  <p>Do you have any queries or suggestions? <a href="mailto:"
                      class="text-decoration-underline">yourinfo@gmail.com</a></p>
                  <p>If you need support? Just give us a call. <a href="#" class="text-decoration-underline">+55 111 222
                      333 44</a></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <hr>
    <div id="footer-bottom" class="mb-2">
      <div class="container">
        <div class="d-flex flex-wrap justify-content-between">
          <div class="ship-and-payment d-flex gap-md-5 flex-wrap">
            <div class="shipping d-flex">
              <p>We ship with:</p>
              <div class="card-wrap ps-2">
                <img src="images/dhl.png" alt="visa">
                <img src="images/shippingcard.png" alt="mastercard">
              </div>
            </div>
            <div class="payment-method d-flex">
              <p>Payment options:</p>
              <div class="card-wrap ps-2">
                <img src="images/visa.jpg" alt="visa">
                <img src="images/mastercard.jpg" alt="mastercard">
                <img src="images/paypal.jpg" alt="paypal">
              </div>
            </div>
          </div>
          <div class="copyright">
            <p>© Copyright 2024 Bookly. HTML Template by <a href="https://templatesjungle.com/"
                target="_blank">TemplatesJungle</a>
            </p>
          </div>
        </div>
      </div>
    </div>

    <script src="js/jquery-1.11.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script type="text/javascript" src="js/script.js"></script>
  </body>
</html>