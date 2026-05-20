<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:include page="/templates/head.jsp">
        <jsp:param name="title" value="Admin Dashboard — Beauty Bajar"/>
    </jsp:include>
    <body>
        <div class="page">
            <jsp:include page="/templates/header.jsp"/>

            <jsp:include page="/templates/nav.jsp">
                <jsp:param name="back_title" value=""/>
                <jsp:param name="back_href" value=""/>
                <jsp:param name="page_title" value="Admin Dashboard"/>
                <jsp:param name="action_title" value=""/>
                <jsp:param name="action_href" value=""/>
            </jsp:include>

            <main class="content">
                <% if (request.getAttribute("success") != null) { %>
                <div class="msg-success"><%= request.getAttribute("success") %></div>
                <% } %>

                <!-- Stats Cards -->
                <div class="dashboard-grid">
                    <div class="dash-card">
                        <div class="dash-num"><%= request.getAttribute("totalUsers") != null ? request.getAttribute("totalUsers") : "0" %></div>
                        <div class="dash-label">Total Users</div>
                    </div>
                    <div class="dash-card">
                        <div class="dash-num"><%= request.getAttribute("totalProducts") != null ? request.getAttribute("totalProducts") : "0" %></div>
                        <div class="dash-label">Products</div>
                    </div>
                    <div class="dash-card">
                        <div class="dash-num"><%= request.getAttribute("totalOrders") != null ? request.getAttribute("totalOrders") : "0" %></div>
                        <div class="dash-label">Total Orders</div>
                    </div>
                    <div class="dash-card">
                        <div class="dash-num">Rs. <%= request.getAttribute("totalRevenue") != null ? request.getAttribute("totalRevenue") : "0" %></div>
                        <div class="dash-label">Revenue</div>
                    </div>
                </div>

                <!-- Quick Links -->
                <div style="display:flex; gap:12px; margin-bottom:24px; flex-wrap:wrap;">
                    <a href="${pageContext.request.contextPath}/admin/products" class="btn-primary">Manage Products</a>
                    <a href="${pageContext.request.contextPath}/admin/users"    class="btn-primary">Manage Users</a>
                    <a href="${pageContext.request.contextPath}/admin/orders"   class="btn-primary">Manage Orders</a>
                    <a href="${pageContext.request.contextPath}/admin/products?action=new" class="btn-primary">Add Product</a>
                </div>

                <!-- Chart + Recent Orders side by side -->
                <section class="admin-dashboard-section">

                    <!-- Sales Trend Chart -->
                    <div class="admin-chart-panel">
                        <div class="table-header">
                            <h3>Sales Trend</h3>
                            <select id="yearSelect" onchange="updateChart()" class="year-select">
                                <option value="2024">2024</option>
                                <option value="2025" selected>2025</option>
                                <option value="2026">2026</option>
                            </select>
                        </div>
                        <div class="chart-container">
                            <div class="chart-wrapper">
                                <canvas id="salesChart"></canvas>
                            </div>
                        </div>
                    </div>

                    <!-- Recent Orders -->
                    <section class="admin-recent-panel">
                        <h3>Recent Orders</h3>
                        <ul class="recent-orders-list">
                            <li>
                                <span class="order-name">Priya Sharma</span>
                                <span class="order-amount">Rs. 2,300</span>
                                <span class="badge badge-active">Delivered</span>
                            </li>
                            <li>
                                <span class="order-name">Anita Thapa</span>
                                <span class="order-amount">Rs. 1,580</span>
                                <span class="badge badge-pending">Shipped</span>
                            </li>
                            <li>
                                <span class="order-name">Sunita Gurung</span>
                                <span class="order-amount">Rs. 850</span>
                                <span class="badge badge-pending">Confirmed</span>
                            </li>
                            <li>
                                <span class="order-name">Kabita Rai</span>
                                <span class="order-amount">Rs. 3,650</span>
                                <span class="badge badge-inactive">Pending</span>
                            </li>
                            <li>
                                <span class="order-name">Manisha Koirala</span>
                                <span class="order-amount">Rs. 1,200</span>
                                <span class="badge badge-active">Delivered</span>
                            </li>
                        </ul>
                        <a href="${pageContext.request.contextPath}/admin/orders" class="btn-edit" style="margin-top:14px; display:inline-block;">View All Orders</a>
                    </section>

                </section>

            </main>

            <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/4.4.1/chart.umd.min.js"></script>
            <script>
                const salesData = {
                    2024: {
                        revenue: [8000, 12000, 10000, 18000, 15000, 22000, 20000, 28000, 25000, 32000, 30000, 38000],
                        orders:  [3, 5, 4, 8, 7, 10, 9, 13, 11, 15, 14, 18]
                    },
                    2025: {
                        revenue: [12000, 19000, 15000, 25000, 22000, 30000, 28000, 35000, 32000, 40000, 38000, 45000],
                        orders:  [5, 8, 6, 12, 10, 15, 13, 18, 16, 20, 19, 23]
                    },
                    2026: {
                        revenue: [15000, 22000, 18000, 28000, 25000, 0, 0, 0, 0, 0, 0, 0],
                        orders:  [7, 10, 8, 14, 12, 0, 0, 0, 0, 0, 0, 0]
                    }
                };

                const ctx = document.getElementById('salesChart').getContext('2d');
                const chart = new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                        datasets: [{
                            label: 'Revenue (Rs.)',
                            data: salesData[2025].revenue,
                            borderColor: '#E8846A',
                            backgroundColor: 'rgba(232,132,106,0.1)',
                            borderWidth: 2,
                            pointBackgroundColor: '#E8846A',
                            pointBorderColor: '#fff',
                            pointRadius: 5,
                            tension: 0.4,
                            fill: true
                        }, {
                            label: 'Orders',
                            data: salesData[2025].orders,
                            borderColor: '#C4604A',
                            backgroundColor: 'rgba(196,96,74,0.05)',
                            borderWidth: 2,
                            pointBackgroundColor: '#C4604A',
                            pointBorderColor: '#fff',
                            pointRadius: 5,
                            tension: 0.4,
                            fill: true,
                            yAxisID: 'y1'
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        interaction: { mode: 'index', intersect: false },
                        plugins: {
                            legend: { position: 'top', labels: { font: { size: 13 }, color: '#2C1810' } },
                            tooltip: {
                                backgroundColor: '#fff',
                                titleColor: '#2C1810',
                                bodyColor: '#6B3A2A',
                                borderColor: '#F5C4B0',
                                borderWidth: 1,
                                padding: 12,
                                callbacks: {
                                    label: function(context) {
                                        if (context.dataset.label === 'Revenue (Rs.)') {
                                            return ' Rs. ' + context.parsed.y.toLocaleString();
                                        }
                                        return ' ' + context.parsed.y + ' orders';
                                    }
                                }
                            }
                        },
                        scales: {
                            x: { grid: { color: 'rgba(245,196,176,0.3)' }, ticks: { color: '#6B3A2A' } },
                            y: {
                                position: 'left',
                                title: { display: true, text: 'Revenue (Rs.)', color: '#E8846A' },
                                grid: { color: 'rgba(245,196,176,0.3)' },
                                ticks: { color: '#6B3A2A', callback: function(v) { return 'Rs. ' + v.toLocaleString(); } }
                            },
                            y1: {
                                position: 'right',
                                title: { display: true, text: 'Orders', color: '#C4604A' },
                                grid: { drawOnChartArea: false },
                                ticks: { color: '#6B3A2A' }
                            }
                        }
                    }
                });

                function updateChart() {
                    const year = document.getElementById('yearSelect').value;
                    chart.data.datasets[0].data = salesData[year].revenue;
                    chart.data.datasets[1].data = salesData[year].orders;
                    chart.update();
                }
            </script>

            <%@include file="/templates/footer.html" %>
        </div>
    </body>
</html>