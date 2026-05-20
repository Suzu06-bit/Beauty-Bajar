<%@page import="com.mycompany.beautybajar.model.Product"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Home — Beauty Bajar"/>
    </jsp:include>
    <body>
        <!-- ANNOUNCEMENT BAR -->
        <div class="announce-bar">
            <span>&#10022; FREE DELIVERY ALL OVER NEPAL on orders above Rs. 999</span>
            <span>&#10022; USE CODE: BEAUTY10 for 10% off</span>
            <span>&#10022; 100% AUTHENTIC PRODUCTS GUARANTEED</span>
        </div>

        <!-- Top Nav -->
        <nav>
            <a href="${pageContext.request.contextPath}/home" class="nav-logo">
                <%-- Replace src with your actual logo path --%>
                <img src="${pageContext.request.contextPath}/images/beauty-bajar-logo.png"
                     alt="Beauty Bajar"
                     onerror="this.style.display='none'; this.nextElementSibling.style.display='block'"/>
            </a>
            <ul class="nav-link">
                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                <li><a href="${pageContext.request.contextPath}/products">Shop</a></li>
                <li><a href="${pageContext.request.contextPath}/products?cat=2">Skincare</a></li>
                <li><a href="${pageContext.request.contextPath}/products?cat=1">Makeup</a></li>
                <li><a href="${pageContext.request.contextPath}/about">About</a></li>
                <li><a href="${pageContext.request.contextPath}/contact">Contact</a></li>
                    <% if (session != null && session.getAttribute("userId") != null) { %>
                <li><a href="${pageContext.request.contextPath}/profile" class="nav-icon-btn">&#128100;</a></li>
                <li><a href="${pageContext.request.contextPath}/logout" class="btn-login">Logout</a></li>
                    <% } else { %>
                <li><a href="${pageContext.request.contextPath}/login" class="btn-login">Login</a></li>
                    <% } %>
            </ul>
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
                    <a href="${pageContext.request.contextPath}/about" class="btn-secondary">Learn More &#8594;</a>
                    <a href="${pageContext.request.contextPath}/products?cat=new" class="btn-new">
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
            <div class="hero-image-box">
                <img src="${pageContext.request.contextPath}/images/hero.png" 
                     alt="Beauty"/>  
            </div>
        </section>

        <!-- CATEGORIES -->
        <section class="categories-section">
            <div class="section-header">
                <span class="section-tag">Browse by Category</span>
                <h2 class="section-title">Shop Your Favourites</h2>
                <p class="section-sub">Explore our wide range of beauty categories</p>
            </div>
            <div class="categories-grid">
                <a href="${pageContext.request.contextPath}/products?cat=1" class="cat-card">
                    <div class="cat-icon">
                        <img src="${pageContext.request.contextPath}/images/cat-lipstick.png" alt="Lipstick"/>
                    </div>
                    <div class="cat-name">Lipstick</div>
                    <div class="cat-count">50+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=2" class="cat-card">
                    <div class="cat-icon">
                        <img src="${pageContext.request.contextPath}/images/cat-skincare.png" alt="Skincare"/>
                    </div>
                    <div class="cat-name">Skincare</div>
                    <div class="cat-count">80+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=3" class="cat-card">
                    <div class="cat-icon">
                        <img src="${pageContext.request.contextPath}/images/cat-foundation.png" alt="Foundation"/>
                    </div>
                    <div class="cat-name">Foundation</div>
                    <div class="cat-count">40+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=4" class="cat-card">
                    <div class="cat-icon">
                        <img src="${pageContext.request.contextPath}/images/cat-eyeshadow.png" alt="Eyeshadow"/>
                    </div>
                    <div class="cat-name">Eyeshadow</div>
                    <div class="cat-count">60+ products</div>
                </a>
                <a href="${pageContext.request.contextPath}/products?cat=5" class="cat-card">
                    <div class="cat-icon">
                        <img src="${pageContext.request.contextPath}/images/cat-perfume.png" alt="Perfume"/>
                    </div>
                    <div class="cat-name">Perfume</div>
                    <div class="cat-count">30+ products</div>
                </a>
            </div>
        </section>

        <!-- FEATURED PRODUCTS -->
        <section class="products-section">
            <div class="section-header">
                <span class="section-tag">Bestsellers</span>
                <h2 class="section-title">Featured Products</h2>
                <p class="section-sub">Handpicked favourites loved by our customers</p>
            </div>
            <div class="products-grid">
                <%
                    List<Product> products = (List<Product>) request.getAttribute("featuredProducts");
                    if (products != null && !products.isEmpty()) {
                        for (Product p : products) {
                %>
                <div class="product-card">
                    <div class="product-img">
                        <% if (p.getImage() != null && !p.getImage().isEmpty()) {%>
                        <img src="${pageContext.request.contextPath}/<%= p.getImage()%>"
                             alt="<%= p.getName()%>"/>
                        <% } else { %>
                        <div class="product-img-placeholder">&#127774;</div>
                        <% }%>
                        <span class="product-badge">Popular</span>
                        <button class="product-wish">&#9825;</button>
                    </div>
                    <div class="product-info">
                        <div class="product-brand">Beauty Bajar</div>
                        <div class="product-name"><%= p.getName()%></div>
                        <div class="product-rating">
                            <span class="stars">&#9733;&#9733;&#9733;&#9733;&#9733;</span>
                            <span class="rating-count">(24)</span>
                        </div>
                        <div class="product-footer">
                            <span class="product-price">Rs. <%= String.format("%.0f", p.getPrice())%></span>
                            <a href="${pageContext.request.contextPath}/cart?action=add&id=<%= p.getProductId()%>"
                               class="btn-add-cart">Add to Cart</a>
                        </div>
                    </div>
                </div>
                <%
                    }
                } else {

                    // Placeholder cards when no DB data
                    String[] names = {"MAC Ruby Woo Lipstick", "Garnier Vitamin C Serum", "Maybelline Foundation", "NYX Eyeshadow Palette"};
                    String[] prices = {"1450", "750", "550", "680"};
                    String[] images = {
                        "images/products/mac-ruby-woo.jpeg",
                        "images/products/garnier-vitamin-c.jpeg",
                        "images/products/maybelline-foundation.png",
                        "images/products/nyx-eyeshadow.jpg"
                    };
                    for (int i = 0; i < 4; i++) {
                %>
                <div class="product-card">
                    <div class="product-img">
                        <img src="${pageContext.request.contextPath}/<%= images[i]%>"
                             alt="<%= names[i]%>"
                             onerror="this.style.display='none'"/>
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
                <%
                        }
                    }
                %>
            </div>
            <div style="text-align:center; margin-top:30px;">
                <a href="${pageContext.request.contextPath}/products" class="btn-primary">View All Products &#8594;</a>
            </div>
        </section>

        <!-- PROMO BANNER -->
        <section class="banner-section">
            <div class="banner-text">
                <h2>Express Delivery<br/><em>All Over Nepal</em></h2>
                <p>Get your favourite beauty products delivered to your doorstep anywhere in Nepal.
                    Same-day delivery in Pokhara Valley. Cash on delivery available.</p>
                <a href="${pageContext.request.contextPath}/products" class="btn-white">Shop Now &#8594;</a>
            </div>
            <div class="banner-perks">
                <div class="perk-card">
                    <div class="perk-icon">
                        <img src="${pageContext.request.contextPath}/images/perks/free-delivery.jpeg" alt="Free Delivery" style="width:50px;height:50px;object-fit:cover;border-radius:8px;display:block;"/>
                    </div>
                    <div class="perk-title">Free Delivery</div>
                    <div class="perk-desc">Free shipping on orders above Rs. 999 across Nepal</div>
                </div>
                <div class="perk-card">
                    <div class="perk-icon">
                        <img src="${pageContext.request.contextPath}/images/perks/cash-on-delivery.jpeg" alt="Cash on Delivery" style="width:50px;height:50px;object-fit:cover;border-radius:8px;display:block;"/>
                    </div>
                    <div class="perk-title">Cash on Delivery</div>
                    <div class="perk-desc">Pay when you receive your order — no advance payment needed</div>
                </div>
                <div class="perk-card">
                    <div class="perk-icon">
                        <img src="${pageContext.request.contextPath}/images/perks/authentic.jpeg" alt="100% Authentic" style="width:50px;height:50px;object-fit:cover;border-radius:8px;display:block;"/>
                    </div>
                    <div class="perk-title">100% Authentic</div>
                    <div class="perk-desc">All products are genuine and sourced from official distributors</div>
                </div>
                <div class="perk-card">
                    <div class="perk-icon">
                        <img src="${pageContext.request.contextPath}/images/perks/easy-returns.jpeg" alt="Easy Returns" style="width:50px;height:50px;object-fit:cover;border-radius:8px;display:block;"/>
                    </div>
                    <div class="perk-title">Easy Returns</div>
                    <div class="perk-desc">7-day hassle-free return and exchange policy</div>
                </div>
            </div>
        </section>

        <!-- TESTIMONIALS -->
        <section class="testimonials-section">
            <div class="section-header">
                <span class="section-tag">Customer Love</span>
                <h2 class="section-title">What Our Customers Say</h2>
                <p class="section-sub">Thousands of happy customers across Nepal</p>
            </div>
            <div class="testimonials-grid">
                <div class="testimonial-card">
                    <div class="test-stars">&#9733;&#9733;&#9733;&#9733;&#9733;</div>
                    <p class="test-text">"Amazing products and super fast delivery! Got my Korean skincare delivered to Pokhara within a day. Will definitely order again!"</p>
                    <div class="test-author">
                        <div class="test-avatar">P</div>
                        <div>
                            <div class="test-name">Priya Sharma</div>
                            <div class="test-loc">Pokhara, Nepal</div>
                        </div>
                    </div>
                </div>
                <div class="testimonial-card">
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
                <div class="testimonial-card">
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

        <%@include file="/templates/footer.html" %>

    </body>
</html>