

<%@page import="com.mycompany.beautybajar.model.product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Beauty Bajar — Nepal's Premium Cosmetics</title>
        <link rel="icon" href="./images/beauty-bajar-logo.png" type="image/png">
        <!--<link rel="stylesheet" href="./css/login_register.css" />-->
    </head>
    <body>

        <!-- ANNOUNCEMENT BAR -->
        <div class="announce-bar">
            <span>&#10022; FREE DELIVERY ALL OVER NEPAL on orders above Rs. 999</span>
            <span>&#10022; USE CODE: BEAUTY10 for 10% off</span>
            <span>&#10022; 100% AUTHENTIC PRODUCTS GUARANTEED</span>
        </div>

        <!-- NAVBAR -->
        <nav>
            <a href="${pageContext.request.contextPath}/home" class="nav-logo">
                <%-- Replace src with your actual logo path --%>
                <img src="${pageContext.request.contextPath}/images/beauty-bajar-logo.png"
                     alt="Beauty Bajar"
                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block'"/>
                <span style="display:none; font-family:'Playfair Display',serif; font-size:26px; font-weight:700; color:#2C1810;">
                    Beauty <span style="color:#E8846A;">Bajar</span>
                </span>
            </a>

            <ul class="nav-links">
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Shop</a></li>
                <li><a href="${pageContext.request.contextPath}/products?cat=skincare">Skincare</a></li>
                <li><a href="${pageContext.request.contextPath}/products?cat=makeup">Makeup</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
            </ul>

            <div class="nav-icons">
                <a href="${pageContext.request.contextPath}/products" class="nav-icon-btn" title="Search">&#128269;</a>
                <a href="${pageContext.request.contextPath}/wishlist" class="nav-icon-btn" title="Wishlist">&#9825;</a>
                <a href="${pageContext.request.contextPath}/cart" class="nav-icon-btn" title="Cart">
                    &#128717;
                    <span class="cart-count">
                        <% Integer cartCount = (Integer) session.getAttribute("cartCount");
            out.print(cartCount != null ? cartCount : 0); %>
                    </span>
                </a>
                <% if (session.getAttribute("userId") != null) { %>
                <a href="${pageContext.request.contextPath}/profile" class="nav-icon-btn">&#128100;</a>
                <a href="${pageContext.request.contextPath}/logout" class="btn-login">Logout</a>
                <% } else { %>
                <a href="${pageContext.request.contextPath}/login" class="btn-login">Login</a>
                <% } %>
            </div>
        </nav>

        <!-- HERO -->
        <section class="hero">
            <div class="hero-text">
                <span class="hero-badge">&#10022; Nepal's #1 Cosmetics Store</span>
                <h1 class="hero-title">
                    Discover Your<br/>
                    <em>Natural Beauty</em><br/>
                    Essence
                </h1>
                <p class="hero-subtitle">
                    Premium cosmetics, skincare &amp; beauty products delivered
                    express all over Nepal. From Korean skincare to luxury makeup —
                    everything your beauty routine needs.
                </p>
                <div class="hero-btns">
                    <a href="${pageContext.request.contextPath}/products" class="btn-primary">Shop Now &#8594;</a>
                    <a href="${pageContext.request.contextPath}/products?cat=new" class="btn-secondary">
                        New Arrivals <span class="arrow">&#8594;</span>
                    </a>
                </div>
                <div class="hero-stats">
                    <div>
                        <div class="stat-num">500+</div>
                        <div class="stat-label">Products</div>
                    </div>
                    <div>
                        <div class="stat-num">10K+</div>
                        <div class="stat-label">Happy Customers</div>
                    </div>
                    <div>
                        <div class="stat-num">77</div>
                        <div class="stat-label">Districts Delivered</div>
                    </div>
                </div>
            </div>

            <div class="hero-image">
                <div class="hero-image-main">
                    <%-- Place a hero cosmetics image here --%>
                    <img src="${pageContext.request.contextPath}/images/hero-cosmetics.png"
                         alt="Beauty Products"
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='block'"/>
                    <div class="hero-img-placeholder" style="display:none">
                        &#128144;<br/>Premium<br/>Beauty Products
                    </div>
                </div>
                <div class="hero-float-card left">
                    <div class="float-icon">&#11088;</div>
                    <div class="float-val">4.9</div>
                    <div style="font-size:11px; color:#999">Customer Rating</div>
                </div>
                <div class="hero-float-card right">
                    <div class="float-icon">&#128666;</div>
                    <div class="float-val">Free</div>
                    <div style="font-size:11px; color:#999">Express Delivery</div>
                </div>
            </div>
        </section>

        <!-- MARQUEE -->
        <div class="marquee-strip">
            <div class="marquee-inner">
                <span>FREE DELIVERY ALL OVER NEPAL</span>
                <span>&#10022;</span>
                <span>100% AUTHENTIC PRODUCTS</span>
                <span>&#10022;</span>
                <span>KOREAN SKINCARE</span>
                <span>&#10022;</span>
                <span>LUXURY MAKEUP</span>
                <span>&#10022;</span>
                <span>CASH ON DELIVERY AVAILABLE</span>
                <span>&#10022;</span>
                <span>SAME DAY DELIVERY IN KATHMANDU</span>
                <span>&#10022;</span>
                <span>FREE DELIVERY ALL OVER NEPAL</span>
                <span>&#10022;</span>
                <span>100% AUTHENTIC PRODUCTS</span>
                <span>&#10022;</span>
                <span>KOREAN SKINCARE</span>
                <span>&#10022;</span>
                <span>LUXURY MAKEUP</span>
                <span>&#10022;</span>
                <span>CASH ON DELIVERY AVAILABLE</span>
                <span>&#10022;</span>
                <span>SAME DAY DELIVERY IN KATHMANDU</span>
                <span>&#10022;</span>
            </div>
        </div>

        <!-- CATEGORIES -->
        <section class="section categories-section">
            <div class="section-header reveal">
                <span class="section-tag">Browse by Category</span>
                <h2 class="section-title">Shop Your Favourites</h2>
                <p class="section-sub">Explore our wide range of beauty categories</p>
            </div>
            <div class="categories-grid reveal">
                <a href="${pageContext.request.contextPath}/products?cat=1" class="cat-card">
                    <div class="cat-icon">&#128138;</div>
                    <div class="cat-name">Lipstick</div>
                    <div class="cat-count">50+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=2" class="cat-card">
                    <div class="cat-icon">&#10024;</div>
                    <div class="cat-name">Skincare</div>
                    <div class="cat-count">80+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=3" class="cat-card">
                    <div class="cat-icon">&#127774;</div>
                    <div class="cat-name">Foundation</div>
                    <div class="cat-count">40+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=4" class="cat-card">
                    <div class="cat-icon">&#128141;</div>
                    <div class="cat-name">Eyeshadow</div>
                    <div class="cat-count">60+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=5" class="cat-card">
                    <div class="cat-icon">&#127804;</div>
                    <div class="cat-name">Perfume</div>
                    <div class="cat-count">30+ products</div>
                </a>
            </div>
        </section>

        <!-- FEATURED PRODUCTS -->
        <section class="section products-section">
            <div class="section-header reveal">
                <span class="section-tag">Bestsellers</span>
                <h2 class="section-title">Featured Products</h2>
                <p class="section-sub">Handpicked favourites loved by our customers</p>
            </div>
            <div class="products-grid">
                <%
                    List<product> products = (List<product>) request.getAttribute("featuredProducts");
                    if (products != null && !products.isEmpty()) {
                        for (product p : products) {
                %>
                <div class="product-card reveal">
                    <div class="product-img">
                        <img src="${pageContext.request.contextPath}/images/products/<%= p.getImage()%>"
                             alt="<%= p.getName()%>"
                             onerror="this.style.display='none'; this.nextElementSibling.style.display='flex'"/>
                        <div class="product-img-placeholder" style="display:none">&#127800;</div>
                        <span class="product-badge">New</span>
                        <button class="product-wish" title="Add to wishlist">&#9825;</button>
                    </div>
                    <div class="product-info">
                        <div class="product-brand">Beauty Bajar</div>
                        <div class="product-name"><%= p.getName()%></div>
                        <div class="product-rating">
                            <span class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                            <span class="rating-count">(24)</span>
                        </div>
                        <div class="product-footer">
                            <div>
                                <span class="product-price">Rs. <%= String.format("%.0f", p.getPrice())%></span>
                            </div>
                            <a href="${pageContext.request.contextPath}/cart?action=add&id=<%= p.getProductId()%>"
                               class="btn-add-cart">Add to Cart</a>
                        </div>
                    </div>
                </div>
                <%  }
                } else {
                    // Sample placeholder cards when no DB data
                    String[] names = {"MAC Ruby Woo Lipstick", "Garnier Vitamin C Serum", "Maybelline Foundation", "NYX Eyeshadow Palette"};
                    String[] prices = {"450", "750", "550", "680"};
                    String[] icons = {"&#128138;", "&#10024;", "&#127774;", "&#128141;"};
                    for (int i = 0; i < 4; i++) {
                %>
                <div class="product-card reveal">
                    <div class="product-img">
                        <div class="product-img-placeholder"><%= icons[i]%></div>
                        <span class="product-badge">Popular</span>
                        <button class="product-wish">&#9825;</button>
                    </div>
                    <div class="product-info">
                        <div class="product-brand">Beauty Bajar</div>
                        <div class="product-name"><%= names[i]%></div>
                        <div class="product-rating">
                            <span class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                            <span class="rating-count">(18)</span>
                        </div>
                        <div class="product-footer">
                            <div>
                                <span class="product-price">Rs. <%= prices[i]%></span>
                                <span class="product-price-old">Rs. <%= Integer.parseInt(prices[i]) + 100%></span>
                            </div>
                            <a href="${pageContext.request.contextPath}/login" class="btn-add-cart">Add to Cart</a>
                        </div>
                    </div>
                </div>
                <% }
        }%>
            </div>
            <div style="text-align:center; margin-top:44px;">
                <a href="${pageContext.request.contextPath}/products" class="btn-primary">View All Products &#8594;</a>
            </div>
        </section>

        <!-- PROMO BANNER -->
        <section class="banner-section">
            <div class="banner-text reveal">
                <h2>Express Delivery<br/><em>All Over Nepal</em></h2>
                <p>Get your favourite beauty products delivered to your doorstep anywhere in Nepal. Same-day delivery in Kathmandu Valley. Cash on delivery available.</p>
                <a href="${pageContext.request.contextPath}/products" class="btn-white">Shop Now &#8594;</a>
            </div>
            <div class="banner-perks reveal">
                <div class="perk-card">
                    <div class="perk-icon">&#128666;</div>
                    <div class="perk-title">Free Delivery</div>
                    <div class="perk-desc">Free shipping on orders above Rs. 999 across Nepal</div>
                </div>
                <div class="perk-card">
                    <div class="perk-icon">&#128179;</div>
                    <div class="perk-title">Cash on Delivery</div>
                    <div class="perk-desc">Pay when you receive your order — no advance payment needed</div>
                </div>
                <div class="perk-card">
                    <div class="perk-icon">&#128142;</div>
                    <div class="perk-title">100% Authentic</div>
                    <div class="perk-desc">All products are genuine and sourced from official distributors</div>
                </div>
                <div class="perk-card">
                    <div class="perk-icon">&#128504;</div>
                    <div class="perk-title">Easy Returns</div>
                    <div class="perk-desc">7-day hassle-free return and exchange policy</div>
                </div>
            </div>
        </section>

        <!-- TESTIMONIALS -->
        <section class="section testimonials-section">
            <div class="section-header reveal">
                <span class="section-tag">Customer Love</span>
                <h2 class="section-title">What Our Customers Say</h2>
                <p class="section-sub">Thousands of happy customers across Nepal</p>
            </div>
            <div class="testimonials-grid">
                <div class="testimonial-card reveal">
                    <div class="test-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="test-text">"Amazing products and super fast delivery! Got my Korean skincare delivered to Pokhara in just 2 days. Will definitely order again!"</p>
                    <div class="test-author">
                        <div class="test-avatar">P</div>
                        <div>
                            <div class="test-name">Priya Sharma</div>
                            <div class="test-loc">Pokhara, Nepal</div>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card reveal">
                    <div class="test-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="test-text">"Best cosmetics store in Nepal! The products are 100% authentic and prices are very reasonable compared to other stores."</p>
                    <div class="test-author">
                        <div class="test-avatar">A</div>
                        <div>
                            <div class="test-name">Anita Thapa</div>
                            <div class="test-loc">Kathmandu, Nepal</div>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card reveal">
                    <div class="test-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="test-text">"I love the variety of products available. Found all my favourite MAC and Maybelline products in one place. Highly recommended!"</p>
                    <div class="test-author">
                        <div class="test-avatar">S</div>
                        <div>
                            <div class="test-name">Sunita Gurung</div>
                            <div class="test-loc">Chitwan, Nepal</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FOOTER -->
        <footer>
            <div class="footer-grid">
                <div class="footer-brand">
                    <img src="${pageContext.request.contextPath}/images/beauty-bajar-logo.png"
                         alt="Beauty Bajar"
                         onerror="this.style.display='none'; this.nextElementSibling.style.display='block'"/>
                    <div style="display:none; font-family:'Playfair Display',serif; font-size:24px; color:white; margin-bottom:16px;">
                        Beauty <span style="color:#E8846A;">Bajar</span>
                    </div>
                    <p>Nepal's premium online cosmetics store. Authentic beauty products delivered express all over Nepal.</p>
                </div>
                <div class="footer-col">
                    <h4>Quick Links</h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                        <li><a href="${pageContext.request.contextPath}/products">All Products</a></li>
                        <li><a href="${pageContext.request.contextPath}/about">About Us</a></li>
                        <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Categories</h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/products?cat=1">Lipstick</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?cat=2">Skincare</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?cat=3">Foundation</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?cat=4">Eyeshadow</a></li>
                        <li><a href="${pageContext.request.contextPath}/products?cat=5">Perfume</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Contact Us</h4>
                    <ul>
                        <li><a href="#">&#128205; Pokhara, Nepal</a></li>
                        <li><a href="tel:+977XXXXXXXX">&#128222; +977-9700000000</a></li>
                        <li><a href="mailto:info@beautybajar.com">&#128140; info@beautybajar.com</a></li>
                        <li><a href="#">&#128241; Instagram: @beautybajar</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                <span>&copy; 2025 Beauty Bajar. All rights reserved.</span>
                <span>Made with &#10084; in Nepal &nbsp;|&nbsp; <a href="#">Privacy Policy</a> &nbsp;|&nbsp; <a href="#">Terms</a></span>
            </div>
        </footer>

        <script>
        // Scroll reveal animation
            const reveals = document.querySelectorAll('.reveal');
            const observer = new IntersectionObserver((entries) => {
                entries.forEach((entry, i) => {
                    if (entry.isIntersecting) {
                        setTimeout(() => entry.target.classList.add('visible'), i * 80);
                    }
                });
            }, {threshold: 0.1});
            reveals.forEach(el => observer.observe(el));

        // Wishlist toggle
            document.querySelectorAll('.product-wish').forEach(btn => {
                btn.addEventListener('click', function () {
                    this.textContent = this.textContent === '♡' ? '♥' : '♡';
                    this.style.background = this.textContent === '♥' ? '#E8846A' : 'white';
                    this.style.color = this.textContent === '♥' ? 'white' : 'inherit';
                });
            });
        </script>

    </body>
</html>

