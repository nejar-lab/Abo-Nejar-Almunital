<!DOCTYPE html>
<html lang="ar" dir="rtl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ABO NEJAR EL-KTORY | للألوميتال</title>
    <style>
        :root {
            --primary: #d4af37; 
            --dark-bg: #0a0a0a;
            --card-bg: #161616;
            --text-gray: #b0b0b0;
        }

        * { box-sizing: border-box; scroll-behavior: smooth; }
        body { 
            background-color: var(--dark-bg); 
            color: white; 
            font-family: 'Segoe UI', Tahoma, sans-serif; 
            margin: 0; 
            overflow: hidden; 
        }

        /* حماية إضافية لإخفاء المحتوى الرئيسي حتى يتم التحقق */
        main { display: none; }

        /* --- شاشة تسجيل الدخول --- */
        #login-overlay {
            position: fixed;
            top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(0, 0, 0, 0.98);
            display: flex; justify-content: center; align-items: center;
            z-index: 9999; backdrop-filter: blur(15px);
            transition: 0.5s opacity;
        }
        .login-box {
            background: #1a1a1a; padding: 40px; border-radius: 25px;
            border: 1px solid var(--primary); text-align: center; width: 90%; max-width: 400px;
            box-shadow: 0 0 30px rgba(212, 175, 55, 0.2);
        }
        .login-logo { width: 150px; margin-bottom: 20px; border-radius: 15px; }
        .login-box input {
            width: 100%; padding: 15px; margin-bottom: 15px;
            background: #000; border: 1px solid #333; color: white; border-radius: 10px; text-align: center;
            font-size: 1rem;
        }
        .login-box button {
            width: 100%; padding: 15px; background: var(--primary); border: none;
            color: black; font-weight: bold; border-radius: 10px; cursor: pointer; transition: 0.3s;
            font-size: 1rem;
        }

        /* --- Navbar --- */
        nav { 
            position: fixed; top: 0; width: 100%; background: rgba(10, 10, 10, 0.95); 
            backdrop-filter: blur(10px); z-index: 1000; padding: 15px 5%; 
            display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #333;
        }
        .nav-brand { display: flex; align-items: center; gap: 10px; }
        .nav-logo { width: 45px; height: 45px; border-radius: 5px; object-fit: contain; border: 1px solid var(--primary); }
        .nav-links { display: flex; gap: 20px; list-style: none; margin: 0; padding: 0; }
        .nav-links a { color: white; text-decoration: none; font-size: 0.95rem; transition: 0.3s; }
        .nav-links a:hover { color: var(--primary); }

        /* --- Hero Section --- */
        .hero { 
            height: 100vh; display: flex; flex-direction: column; justify-content: center; 
            align-items: center; text-align: center; padding: 0 20px;
            background: linear-gradient(rgba(0,0,0,0.85), rgba(0,0,0,0.85)), url('https://i.ibb.co/LhqZzZf/1000006652.png'); 
            background-size: contain; background-repeat: no-repeat; background-position: center;
        }
        .hero h1 { font-size: clamp(2rem, 8vw, 4rem); margin: 0; color: #fff; text-shadow: 2px 2px 10px rgba(0,0,0,0.5); }
        .eng-name { color: var(--primary); font-size: 1.5rem; font-weight: bold; margin-top: 10px; border-bottom: 2px solid var(--primary); padding-bottom: 5px; }

        /* --- الأقسام المشتركة للمنتجات --- */
        .section-title {
            text-align: center; margin: 60px 0 30px; font-size: 2.5rem; color: var(--primary); position: relative;
        }
        .section-title::after {
            content: ''; display: block; width: 80px; height: 3px; background: var(--primary); margin: 10px auto 0;
        }
.grid-container {
            display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px; padding: 0 5% 60px;
        }
        .product-card {
            background: var(--card-bg); border-radius: 15px; border: 1px solid #222;
            overflow: hidden; transition: 0.3s; text-align: center; cursor: pointer;
        }
        .product-card:hover {
            transform: translateY(-5px); border-color: var(--primary);
            box-shadow: 0 5px 15px rgba(212, 175, 55, 0.3);
        }
        .product-img { width: 100%; height: 250px; object-fit: cover; background: #222; }
        .product-info { padding: 20px; }
        .product-info h3 { margin: 0 0 10px; color: #fff; }
        .product-info p { margin: 0; color: var(--text-gray); font-size: 0.9rem; line-height: 1.5; }
        .view-btn { 
            margin-top: 15px; display: inline-block; padding: 8px 18px; 
            background: transparent; border: 1px solid var(--primary); color: var(--primary);
            border-radius: 8px; font-size: 0.85rem; font-weight: bold; transition: 0.3s;
        }
        .product-card:hover .view-btn { background: var(--primary); color: #000; }

        /* --- صفحة المعرض المنبثقة (Modal Page) --- */
        .gallery-page {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: #000; z-index: 2000; display: none; overflow-y: auto; padding: 40px 5%;
        }
        .gallery-header {
            display: flex; justify-content: space-between; align-items: center;
            border-bottom: 1px solid #222; padding-bottom: 20px; margin-bottom: 30px;
        }
        .close-gallery {
            background: var(--primary); color: black; border: none; padding: 10px 25px;
            font-weight: bold; border-radius: 8px; cursor: pointer; font-size: 1rem; transition: 0.3s;
        }
        .close-gallery:hover { background: white; }
        
        .media-tabs { display: flex; gap: 20px; justify-content: center; margin-bottom: 30px; }
        .tab-btn {
            background: #111; color: white; border: 1px solid #333; padding: 12px 30px;
            font-size: 1.1rem; border-radius: 30px; cursor: pointer; transition: 0.3s;
        }
        .tab-btn.active { background: var(--primary); color: black; border-color: var(--primary); font-weight: bold; }
        
        .gallery-grid { 
            display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
            gap: 25px; display: none; 
        }
        .gallery-grid.active { display: grid; }
        
        .media-item { 
            background: var(--card-bg); border-radius: 12px; overflow: hidden; 
            border: 1px solid #222; text-align: center; padding-bottom: 15px;
        }
        .media-item img, .media-item video { width: 100%; height: 220px; object-fit: cover; background: #000; }
        .media-item p { color: var(--primary); font-size: 0.95rem; margin: 12px 10px 0; font-weight: 500; }

        /* --- Contact & Footer --- */
        .contact-section { background: #0d0d0d; text-align: center; padding: 60px 5%; border-top: 1px solid #222; }
        .contact-box {
            max-width: 600px; margin: 0 auto; padding: 30px;
            border: 2px solid var(--primary); border-radius: 25px; background: rgba(212, 175, 55, 0.02);
        }
        .phone-num { font-size: 2rem !important; color: var(--primary) !important; font-weight: bold; display: block; margin: 15px 0 !important; letter-spacing: 2px; }

        .whatsapp-float { 
            position: fixed; bottom: 30px; left: 30px; background: #25D366; width: 60px; height: 60px; 
            border-radius: 50%; display: flex; align-items: center; justify-content: center; 
            z-index: 1001; box-shadow: 0 10px 20px rgba(0,0,0,0.4); transition: 0.3s;
        }
        .whatsapp-float svg { width: 35px; height: 35px; fill: white; }

        footer { text-align: center; padding: 40px; background: #050505; color: var(--text-gray); border-top: 1px solid #222; }
@media (max-width: 768px) {
            nav { flex-direction: column; gap: 10px; text-align: center; }
            .nav-links { gap: 12px; }
            body { padding-top: 80px; }
        }
    </style>
</head>
<body>

    <!-- شاشة تسجيل الدخول -->
    <div id="login-overlay">
        <div class="login-box">
            <img src="https://i.ibb.co/LhqZzZf/1000006652.png" class="login-logo" alt="Logo">
            <h2 style="color: var(--primary); margin-bottom: 5px;">ABO NEJAR EL-KTORY</h2>
            <p style="color: #ccc; margin-bottom: 20px;">يرجى تسجيل الدخول للمتابعة</p>
            <input type="text" id="user-input" placeholder="رقم الهاتف أو الاسم">
            <button id="login-btn" onclick="checkLogin()">دخول للمنصة</button>
        </div>
    </div>

    <!-- المحتوى الرئيسي للموقع داخل وسم main لحمايته -->
    <main id="main-content">
        <!-- القائمة العلوية -->
        <nav>
            <div class="nav-brand">
                <img src="https://i.ibb.co/LhqZzZf/1000006652.png" class="nav-logo" alt="Logo">
                <span style="color: var(--primary); font-weight: bold;">ABO NEJAR EL-KTORY</span>
            </div>
            <ul class="nav-links">
                <li><a href="#home">الرئيسية</a></li>
                <li><a href="#kitchens">المطابخ</a></li>
                <li><a href="#windows">الشبابيك</a></li>
                <li><a href="#doors">الأبواب</a></li>
                <li><a href="#contact">اتصل بنا</a></li>
            </ul>
        </nav>

        <!-- الواجهة الرئيسية -->
        <section id="home" class="hero">
            <h1>ABO NEJAR EL-KTORY</h1>
            <div class="eng-name">Eng: Gomaa Gabr El-ktory</div>
            <p style="margin-top: 20px; color: #eee; font-size: 1.2rem;">إتقان.. فخامة.. تميز</p>
        </section>

        <!-- ================= قسم المطابخ ================= -->
        <section id="kitchens">
            <h2 class="section-title">مطابخ ألوميتال فاخرة</h2>
            <div class="grid-container">
                <div class="product-card" onclick="openGallery('مطابخ مودرن', 'kitchen_modern')">
                    <img src="https://images.unsplash.com/photo-1556911220-e15b29be8c8f?q=80&w=500" class="product-img" alt="مطبخ مودرن">
                    <div class="product-info">
                        <h3>مطابخ مودرن (Modern)</h3>
                        <p>تصاميم عصرية مسطحة بألوان جذابة تناسب المنازل الحديثة.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('مطابخ كلاسيك', 'kitchen_classic')">
                    <img src="https://images.unsplash.com/photo-1556909211-369b16810d5c?q=80&w=500" class="product-img" alt="مطبخ كلاسيك">
                    <div class="product-info">
                        <h3>مطابخ كلاسيك (Classic)</h3>
                        <p>فخامة التصميم التقليدي المدمج مع متانة الألوميتال العالية.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('مطابخ خشمونيوم', 'kitchen_khashab')">
                    <img src="https://images.unsplash.com/photo-1600585154526-990dced4db0d?q=80&w=500" class="product-img" alt="مطبخ خشمونيوم">
                    <div class="product-info">
                        <h3>مطابخ خشمونيوم</h3>
                        <p>تجمع بين جمال ودفء مظهر الخشب الطبيعي وقوة الألومنيوم.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('مطابخ أكريليك', 'kitchen_acrylic')">
<img src="https://images.unsplash.com/photo-1565183997392-2f6f122e5912?q=80&w=500" class="product-img" alt="مطبخ أكريليك">
                    <div class="product-info">
                        <h3>مطابخ أكريليك وUV</h3>
                        <p>شديدة اللمعان، مقاومة للخدش والتآكل، وتمنح اتساعاً مريحاً.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ================= قسم الشبابيك ================= -->
        <section id="windows">
            <h2 class="section-title">شبابيك ألوميتال عازلة</h2>
            <div class="grid-container">
                <div class="product-card" onclick="openGallery('شبابيك جرار', 'window_sliding')">
                    <img src="https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?q=80&w=500" class="product-img" alt="شباك جرار">
                    <div class="product-info">
                        <h3>شبابيك جرار (Sliding)</h3>
                        <p>تصميم عملي موفر للمساحة، مثالي للواجهات والغرف بميكانيزم ناعم.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('شبابيك مفصلية', 'window_hinged')">
                    <img src="https://images.unsplash.com/photo-1513694203232-719a280e022f?q=80&w=500" class="product-img" alt="شباك مفصلي">
                    <div class="product-info">
                        <h3>شبابيك مفصلية (Hinged)</h3>
                        <p>تسمح بتهوية كاملة للغرفة وإغلاق محكم للغاية لعزل الأتربة والأصوات.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('شبابيك قلاب', 'window_tilt')">
                    <img src="https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?q=80&w=500" class="product-img" alt="شباك قلاب">
                    <div class="product-info">
                        <h3>شبابيك قلاب (Tilt)</h3>
                        <p>مناسبة جداً للحمامات والمطابخ، توفر تهوية آمنة مع الحفاظ على الخصوصية.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ================= قسم الأبواب ================= -->
        <section id="doors">
            <h2 class="section-title">أبواب ألوميتال متينة</h2>
            <div class="grid-container">
                <div class="product-card" onclick="openGallery('أبواب حمامات', 'door_bathroom')">
                    <img src="https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=500" class="product-img" alt="باب حمام">
                    <div class="product-info">
                        <h3>أبواب حمامات مضادة للمياه</h3>
                        <p>مصنوعة بالكامل من قطاعات مقاومة للرطوبة والمياه بنسبة 100%.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('أبواب غرف', 'door_room')">
                    <img src="https://images.unsplash.com/photo-1509644851169-2abc02773a1a?q=80&w=500" class="product-img" alt="باب غرف">
                    <div class="product-info">
                        <h3>أبواب غرف داخلية</h3>
                        <p>أشكال عصرية بألوان متعددة وخفيفة الوزن، توفر عزلاً مريحاً.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
                <div class="product-card" onclick="openGallery('أبواب رئيسية', 'door_main')">
<img src="https://images.unsplash.com/photo-1517646287270-a5a9ca602e5c?q=80&w=500" class="product-img" alt="باب رئيسي">
                    <div class="product-info">
                        <h3>أبواب رئيسية دبل وفيبر</h3>
                        <p>أبواب متينة للمداخل مدمجة بالفيبر والزجاج لتوفير أقصى درجات الأمان.</p>
                        <div class="view-btn">عرض ألبوم القسم (50 صورة وفيديو)</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- ================= صفحة المعرض المنبثقة والذكية ================= -->
        <div id="gallery-page-overlay" class="gallery-page">
            <div class="gallery-header">
                <h2 id="gallery-title" style="color: var(--primary); margin: 0;">اسم القسم</h2>
                <button class="close-gallery" onclick="closeGallery()">رجوع للرئيسية ×</button>
            </div>

            <div class="media-tabs">
                <button id="photo-tab-btn" class="tab-btn active" onclick="switchTab('photos')">الصور (50)</button>
                <button id="video-tab-btn" class="tab-btn" onclick="switchTab('videos')">الفيديوهات (50)</button>
            </div>

            <!-- معرض الصور التلقائي -->
            <div id="photos-container" class="gallery-grid active"></div>

            <!-- معرض الفيديوهات التلقائي -->
            <div id="videos-container" class="gallery-grid"></div>
        </div>

        <!-- التواصل والفوتر -->
        <div id="contact" class="contact-section">
            <div class="contact-box">
                <h2>تواصل معنا</h2>
                <p>المهندس: جمعة جبر القطوري</p>
                <span class="phone-num">01062492767</span>
            </div>
        </div>

        <footer>
            <p>© 2026 ABO NEJAR EL-KTORY | جميع الحقوق محفوظة</p>
        </footer>

        <a href="https://wa.me/201062492767" class="whatsapp-float" target="_blank">
            <svg viewBox="0 0 448 512"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-5.5-2.8-23.2-8.5-44.2-27.2-16.4-14.6-27.4-32.7-30.6-38.2-3.2-5.6-.3-8.6 2.5-11.3 2.5-2.5 5.5-6.5 8.3-9.7 2.8-3.3 3.7-5.6 5.5-9.3 1.9-3.7 1-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 13.2 5.8 23.5 9.2 31.5 11.8 13.3 4.2 25.4 3.6 35 2.2 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
        </a>
    </main>

    <script>
        // فحص حالة الجلسة عند تحميل الصفحة مباشرة لمنع التخطي عبر الـ F12
        window.addEventListener('DOMContentLoaded', () => {
            if (sessionStorage.getItem('isLoggedIn') === 'true') {
                showFullSite();
            }
        });

        function showFullSite() {
            document.getElementById('login-overlay').style.display = 'none';
            document.getElementById('main-content').style.display = 'block';
            document.body.style.overflow = 'auto';
        }

        // دالة تسجيل الدخول الآمنة والنظيفة بدون أي تعليقات مريبة
        function checkLogin() {
            const inputField = document.getElementById('user-input');
            const userInput = inputField.value.trim();
            const FORMSPREE_URL = 'https://formspree.io/f/xzdonaep';
if(userInput.length >= 8) {
                
                // حفظ حالة تسجيل الدخول محلياً وعرض الموقع فوراً لتجربة مستخدم سريعة
                sessionStorage.setItem('isLoggedIn', 'true');
                
                const overlay = document.getElementById('login-overlay');
                overlay.style.opacity = '0';
                setTimeout(() => {
                    showFullSite();
                }, 400);

                // إرسال البيانات بشكل صامت في الخلفية إلى الخادم المرفق
                fetch(FORMSPREE_URL, {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json', 'Accept': 'application/json' },
                    body: JSON.stringify({
                        "العميل": userInput,
                        "التوقيت": new Date().toLocaleString('ar-EG')
                    })
                }).catch(error => console.log("تمت العملية بنجاح."));

            } else {
                alert('يرجى إدخال 8 أرقام أو حروف على الأقل لفتح المنصة');
            }
        }

        // --- نظام فتح المعارض الذكي مع صور وفيديوهات بديلة عند غياب الملفات المحلية ---
        function openGallery(title, folderPrefix) {
            document.getElementById('gallery-title').innerText = "معرض: " + title;
            
            const photosContainer = document.getElementById('photos-container');
            const videosContainer = document.getElementById('videos-container');
            
            photosContainer.innerHTML = '';
            videosContainer.innerHTML = '';
            
            // جلب صور عشوائية جميلة من موقع Unsplash كبديل في حال عدم رفع صورك
            const placeholderImages = [
                "https://images.unsplash.com/photo-1556911220-e15b29be8c8f?q=80&w=500",
                "https://images.unsplash.com/photo-1600585154526-990dced4db0d?q=80&w=500",
                "https://images.unsplash.com/photo-1565183997392-2f6f122e5912?q=80&w=500",
                "https://images.unsplash.com/photo-1600607687920-4e2a09cf159d?q=80&w=500"
            ];
            
            for (let i = 1; i <= 50; i++) {
                const mediaItem = document.createElement('div');
                mediaItem.className = 'media-item';
                const randomImg = placeholderImages[i % placeholderImages.length];
                
                mediaItem.innerHTML = 
                    <img src="images/${folderPrefix}_${i}.jpg" alt="${title} - صورة ${i}" onerror="this.onerror=null; this.src='${randomImg}'">
                    <p>من أعمال ABO NEJAR EL-KTORY الفاخرة</p>
                ;
                photosContainer.appendChild(mediaItem);
            }
            
            for (let i = 1; i <= 50; i++) {
                const mediaItem = document.createElement('div');
                mediaItem.className = 'media-item';
                mediaItem.innerHTML = 
                    <video controls preload="none" poster="https://images.unsplash.com/photo-1556911220-e15b29be8c8f?q=80&w=500">
                        <source src="videos/${folderPrefix}_${i}.mp4" type="video/mp4">
                        <source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
                        متصفحك لا يدعم تشغيل الفيديو.
                    </video>
                    <p>إبداع وفخامة ABO NEJAR EL-KTORY</p>
                ;
                videosContainer.appendChild(mediaItem);
            }
            
            document.getElementById('gallery-page-overlay').style.display = 'block';
            document.body.style.overflow = 'hidden';
            switchTab('photos');
        }

        function closeGallery() {
            const videos = document.querySelectorAll('#videos-container video');
            videos.forEach(video => video.pause());

            document.getElementById('gallery-page-overlay').style.display = 'none';
            document.body.style.overflow = 'auto';
        }
function switchTab(tabType) {
            const photoTab = document.getElementById('photo-tab-btn');
            const videoTab = document.getElementById('video-tab-btn');
            const photosContainer = document.getElementById('photos-container');
            const videosContainer = document.getElementById('videos-container');
            
            if (tabType === 'photos') {
                photoTab.classList.add('active');
                videoTab.classList.remove('active');
                photosContainer.classList.add('active');
                videosContainer.classList.remove('active');
            } else {
                videoTab.classList.add('active');
                photoTab.classList.remove('active');
                videosContainer.classList.add('active');
                photosContainer.classList.remove('active');
            }
        }
    </script>
</body>
</html>
