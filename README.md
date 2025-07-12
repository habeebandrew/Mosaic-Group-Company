# Mosaic Group Company

Welcome to **Mosaic Group's Flutter Portfolio Application**!

Founded by **Engineer Elias Fayad** and **Graphic Designer Jan Karraz**, we specialize in offering exceptional **interior design**, **graphic design**, **landscaping**, and **painting** services. Our mission is to provide innovative, custom, and high-quality solutions that make your living spaces and designs stand out.

---

## Overview

This Flutter application serves as a digital portfolio and showcase for **Mosaic Group Company**. The app features a responsive design that adapts to desktop and mobile interfaces, providing an immersive experience to explore our comprehensive design services.

🌐 **Live Website**: [Mosaic Group Website](https://mosaic-company.netlify.app)

---

## Application Features

### 🎨 **Interactive Portfolio Showcase**
- **Responsive Design**: Optimized for both desktop and mobile devices
- **Adaptive UI**: Dynamic layout that adjusts based on screen size
- **Multi-platform Support**: Available for Android, iOS, Web, Windows, macOS, and Linux

### 🏠 **Service Categories**
Our application showcases five main service categories:

1. **Interior Decorations**
   - Interior and exterior design services
   - Gypsum design and installation
   - Painting and decoration design
   - Custom design solutions for different spaces

2. **Graphic Design**
   - Brand identity design
   - Creative visual designs
   - Marketing materials
   - Digital and print design solutions

3. **Paint Services**
   - Interior and exterior painting
   - Decorative painting techniques
   - Color consultation
   - Surface preparation and finishing

4. **Landscaping Design**
   - Green space design for homes, restaurants, resorts, and villas
   - Garden planning and layout
   - Outdoor space optimization
   - Plant selection and arrangement

5. **Gypsum Board Design**
   - Ceiling design and installation
   - Wall partitions
   - Decorative gypsum elements
   - Modern interior finishing

### 🖥️ **Interactive User Interface**
- **Carousel Slider**: Dynamic image galleries for each service category
- **Auto-scrolling Images**: Automatic image rotation with manual navigation
- **Image Preview**: Full-screen image viewing with swipe navigation
- **Hover Effects**: Interactive animations and scaling effects
- **Smooth Scrolling**: Seamless navigation between sections

### 📱 **Contact Integration**
- **Direct Communication**: One-click phone calls and email
- **Social Media Links**: Instagram and Telegram integration
- **Responsive Contact Section**: Adapted for different screen sizes
- **Animated Contact Icons**: Pulsing animations for better user engagement

---

## 🛠️ Tech Stack & Architecture

### **Frontend Framework**
- **Flutter**: Cross-platform UI toolkit for building natively compiled applications
- **Dart**: Programming language optimized for building mobile, desktop, server, and web applications

### **UI Components & Libraries**
- **Material Design**: Google's design system for intuitive user interfaces
- **Cupertino Icons**: iOS-style icons for consistent design
- **Carousel Slider**: Interactive image carousels with auto-scroll functionality
- **Smooth Page Indicator**: Visual page indicators for image galleries

### **Platform Support**
- 📱 **Mobile**: Android & iOS
- 🖥️ **Desktop**: Windows, macOS, Linux  
- 🌐 **Web**: Progressive Web App support

### **Key Development Features**
- **Responsive Design System**: Adaptive layouts for different screen sizes
- **Custom Theme**: Consistent color scheme and styling
- **Modular Architecture**: Organized widget structure for maintainability
- **Performance Optimized**: Efficient image loading and smooth animations

---

## 🚀 Installation & Setup

### **Prerequisites**
- Flutter SDK (>=3.0.5 <4.0.0)
- Dart SDK
- IDE (VS Code, Android Studio, or IntelliJ)

### **Installation Steps**

1. **Clone the repository**:
   ```bash
   git clone <repository_url>
   cd mosaic_company
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Run the application**:
   ```bash
   # For development (debug mode)
   flutter run
   
   # For web
   flutter run -d chrome
   
   # For specific platform
   flutter run -d windows
   flutter run -d macos
   flutter run -d linux
   ```

4. **Build for production**:
   ```bash
   # Web build
   flutter build web
   
   # Android APK
   flutter build apk
   
   # iOS build
   flutter build ios
   ```

---

## 📱 Application Usage

### **Navigation**
- **Home Section**: Company introduction with dynamic carousel showcase
- **Skills Section**: Tools and expertise display (AutoCAD, Illustrator, Lumion, Photoshop, Revit)
- **Services Section**: Interactive portfolios for each service category
- **Contact Section**: Direct communication channels

### **Interactive Features**
- 🖱️ **Hover Effects**: Smooth scaling animations on desktop
- 📱 **Touch Responsive**: Optimized touch interactions for mobile
- 🎥 **Auto Carousel**: Self-advancing image galleries
- 🔍 **Image Preview**: Full-screen image viewing with navigation
- 📞 **One-Click Contact**: Direct phone and email integration

---

## 📁 Project Structure

```
mosaic_company/
├── android/                 # Android platform files
├── ios/                     # iOS platform files  
├── web/                     # Web platform files
├── windows/                 # Windows platform files
├── macos/                   # macOS platform files
├── linux/                   # Linux platform files
├── lib/                     # Main application code
│   ├── main.dart           # Application entry point
│   ├── constants/          # App constants and configurations
│   │   ├── colors.dart     # Color theme definitions
│   │   ├── nav_items.dart  # Navigation items
│   │   ├── size.dart       # Responsive size constants
│   │   ├── skill_items.dart # Skills and tools data
│   │   └── sns_links.dart  # Social media links
│   ├── pages/              # Application screens
│   │   ├── home_page.dart  # Main homepage
│   │   └── ImagePreviewScreen.dart # Image preview screen
│   ├── styles/             # Theme and styling
│   │   ├── style.dart      # General styles
│   │   └── theme.dart      # App theme configuration
│   ├── utils/              # Utility functions
│   │   └── project_utils.dart # Helper functions
│   └── widgets/            # Reusable UI components
│       ├── contact_section.dart    # Contact information widget
│       ├── custom_text_field.dart  # Custom input fields
│       ├── drawer_mobile.dart      # Mobile navigation drawer
│       ├── footer.dart             # App footer
│       ├── header_desktop.dart     # Desktop header/navigation
│       ├── header_mobile.dart      # Mobile header
│       ├── main_desktop.dart       # Desktop main content
│       ├── main_mobile.dart        # Mobile main content
│       ├── project_card.dart       # Project display cards
│       ├── ServicesSection.dart    # Services showcase
│       ├── site_logo.dart          # Company logo component
│       ├── skills_desktop.dart     # Desktop skills section
│       └── skills_mobile.dart      # Mobile skills section
├── assets/                  # Static assets
│   ├── apps/               # Software/tool icons
│   ├── basic/              # Basic design images
│   ├── gbs/                # Gypsum board project images
│   ├── graphic/            # Graphic design portfolio
│   ├── inter/              # Interior design projects
│   ├── land/               # Landscaping projects
│   ├── logo/               # Company logos and branding
│   └── paint/              # Painting project images
├── test/                    # Test files
└── pubspec.yaml            # Project dependencies and configuration
```

---

## 🎨 Design Showcase

The application features comprehensive portfolios across our specialization areas:

### **Interior Decorations Portfolio**
- 10+ high-quality project images
- Residential and commercial spaces
- Modern and traditional design approaches

### **Graphic Design Gallery**  
- 12+ creative design examples
- Brand identity projects
- Marketing materials and visual communications

### **Landscaping Projects**
- 13+ outdoor design projects  
- Residential gardens, resort landscapes
- Sustainable and aesthetic green space solutions

### **Paint & Finishing Work**
- Diverse painting techniques and styles
- Interior and exterior applications
- Color coordination and design integration

### **Gypsum Board Designs**
- Modern ceiling and wall treatments
- Architectural detail work
- Contemporary interior finishing solutions

---

## 📞 Contact Information

**Mosaic Group Company**  
**Engineer Elias Fayad** & **Graphic Designer Jan Karraz**

📧 **Email**: [eliasandrehfayad@gmail.com](mailto:eliasandrehfayad@gmail.com)  
📱 **Phone**: [+963 932 684 108](tel:+963932684108)  
📸 **Instagram**: [@mosaic_grop](https://www.instagram.com/mosaic_grop/?igsh=MnVxMGc2cG1kMmVp)  
💬 **Telegram**: [@eliasandrehfayaf](http://t.me/eliasandrehfayaf)

---

## 🤝 Contributing

We welcome contributions to improve the application! To contribute:

1. **Fork the repository**
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Commit your changes**: `git commit -m 'Add amazing feature'`
4. **Push to the branch**: `git push origin feature/amazing-feature`
5. **Open a Pull Request**

### **Development Guidelines**
- Follow Flutter's coding conventions
- Maintain responsive design principles
- Test on multiple platforms before submitting
- Include clear commit messages and documentation

---

## 📄 License

This project is created for **Mosaic Group Company** portfolio purposes.

---

## 🙏 Acknowledgments

- **Flutter Team** for the excellent cross-platform framework
- **Material Design** for comprehensive design guidelines  
- **Mosaic Group Team** for creative vision and project content

---

*© 2024 Mosaic Group Company. All rights reserved.*