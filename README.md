/* GitHub README Styles for Crafty Bay Flutter App */
/* Note: GitHub has limited CSS support in README files. This CSS is designed for */
/* use when the README is viewed in a custom HTML renderer or documentation site. */

:root {
  --primary-blue: #2196f3;
  --primary-dark: #1976d2;
  --accent-orange: #ff9800;
  --success-green: #4caf50;
  --warning-amber: #ffc107;
  --error-red: #f44336;
  --text-primary: #212121;
  --text-secondary: #757575;
  --background-light: #fafafa;
  --background-white: #ffffff;
  --border-light: #e0e0e0;
  --border-medium: #bdbdbd;
  --shadow-light: rgba(0, 0, 0, 0.1);
  --shadow-medium: rgba(0, 0, 0, 0.15);
  --gradient-primary: linear-gradient(135deg, var(--primary-blue), var(--primary-dark));
  --gradient-accent: linear-gradient(135deg, var(--accent-orange), #f57f17);
}

/* Base Styling */
body {
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Noto Sans', Helvetica, Arial, sans-serif;
  line-height: 1.6;
  color: var(--text-primary);
  background-color: var(--background-light);
  margin: 0;
  padding: 20px;
}

/* Main Title */
h1 {
  font-size: 3rem;
  font-weight: 700;
  background: var(--gradient-primary);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  text-align: center;
  margin: 2rem 0;
  position: relative;
}

h1::before {
  content: '';
  position: absolute;
  bottom: -10px;
  left: 50%;
  transform: translateX(-50%);
  width: 100px;
  height: 4px;
  background: var(--gradient-accent);
  border-radius: 2px;
}

/* Project Description */
.project-description {
  background: var(--background-white);
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 20px var(--shadow-light);
  border-left: 4px solid var(--primary-blue);
  margin: 2rem 0;
  position: relative;
  overflow: hidden;
}

.project-description::before {
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  width: 100px;
  height: 100px;
  background: var(--gradient-primary);
  opacity: 0.05;
  border-radius: 50%;
  transform: translate(30px, -30px);
}

/* Section Headers */
h2 {
  font-size: 1.8rem;
  font-weight: 600;
  color: var(--text-primary);
  margin: 2.5rem 0 1rem 0;
  position: relative;
  padding-left: 1rem;
}

h2::before {
  content: '';
  position: absolute;
  left: 0;
  top: 50%;
  transform: translateY(-50%);
  width: 4px;
  height: 100%;
  background: var(--gradient-primary);
  border-radius: 2px;
}

/* Emoji Headers Special Styling */
h2:has-text("📌"), h2:has-text("🏗"), h2:has-text("📦"), h2:has-text("🚀"), h2:has-text("📁"), h2:has-text("🧑‍💻"), h2:has-text("📄"), h2:has-text("📊") {
  background: var(--background-white);
  padding: 1rem 1.5rem;
  border-radius: 8px;
  box-shadow: 0 2px 10px var(--shadow-light);
  border: 1px solid var(--border-light);
}

/* Feature Lists */
ul {
  list-style: none;
  padding: 0;
  margin: 1rem 0;
}

li {
  background: var(--background-white);
  margin: 0.5rem 0;
  padding: 1rem 1.5rem;
  border-radius: 8px;
  box-shadow: 0 2px 8px var(--shadow-light);
  border-left: 3px solid var(--primary-blue);
  transition: all 0.3s ease;
  position: relative;
}

li:hover {
  transform: translateX(5px);
  box-shadow: 0 4px 15px var(--shadow-medium);
  border-left-color: var(--accent-orange);
}

li::before {
  content: '▶';
  color: var(--primary-blue);
  font-weight: bold;
  margin-right: 0.5rem;
}

/* Nested Lists */
li ul {
  margin: 0.5rem 0 0 0;
  padding-left: 1rem;
}

li li {
  background: var(--background-light);
  border-left: 2px solid var(--border-medium);
  padding: 0.5rem 1rem;
  margin: 0.25rem 0;
  font-size: 0.9rem;
}

li li::before {
  content: '•';
  color: var(--text-secondary);
}

/* Code Blocks */
pre {
  background: #2d3748;
  color: #e2e8f0;
  padding: 1.5rem;
  border-radius: 8px;
  overflow-x: auto;
  margin: 1rem 0;
  position: relative;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

pre::before {
  content: attr(data-lang);
  position: absolute;
  top: 0.5rem;
  right: 1rem;
  background: var(--accent-orange);
  color: white;
  padding: 0.2rem 0.5rem;
  border-radius: 4px;
  font-size: 0.7rem;
  text-transform: uppercase;
  font-weight: 600;
}

code {
  background: #f1f5f9;
  color: #1e293b;
  padding: 0.2rem 0.4rem;
  border-radius: 4px;
  font-family: 'SF Mono', Monaco, 'Cascadia Code', 'Roboto Mono', Consolas, 'Courier New', monospace;
  font-size: 0.9em;
}

pre code {
  background: transparent;
  color: inherit;
  padding: 0;
}

/* Tables */
table {
  width: 100%;
  border-collapse: collapse;
  margin: 2rem 0;
  background: var(--background-white);
  border-radius: 8px;
  overflow: hidden;
  box-shadow: 0 4px 20px var(--shadow-light);
}

thead {
  background: var(--gradient-primary);
  color: white;
}

th, td {
  padding: 1rem;
  text-align: left;
  border-bottom: 1px solid var(--border-light);
}

th {
  font-weight: 600;
  text-transform: uppercase;
  font-size: 0.9rem;
  letter-spacing: 0.5px;
}

tbody tr:hover {
  background: var(--background-light);
}

/* Blockquotes */
blockquote {
  background: var(--background-white);
  border-left: 4px solid var(--accent-orange);
  padding: 1.5rem;
  margin: 2rem 0;
  border-radius: 0 8px 8px 0;
  box-shadow: 0 2px 10px var(--shadow-light);
  font-style: italic;
  position: relative;
}

blockquote::before {
  content: '"';
  font-size: 4rem;
  color: var(--accent-orange);
  position: absolute;
  top: -10px;
  left: 15px;
  opacity: 0.3;
  font-family: Georgia, serif;
}

/* Architecture Diagram */
.architecture-diagram {
  background: var(--background-white);
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 20px var(--shadow-light);
  margin: 2rem 0;
  text-align: center;
  border: 2px solid var(--border-light);
}

.architecture-diagram pre {
  background: transparent;
  color: var(--text-primary);
  box-shadow: none;
  font-family: 'Courier New', monospace;
  font-size: 0.9rem;
  line-height: 1.4;
}

/* Badge-like elements */
strong {
  background: var(--gradient-primary);
  color: white;
  padding: 0.2rem 0.6rem;
  border-radius: 20px;
  font-size: 0.85rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  margin: 0 0.2rem;
  white-space: nowrap;
}

/* Links */
a {
  color: var(--primary-blue);
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s ease;
}

a:hover {
  color: var(--primary-dark);
  text-decoration: underline;
}

/* Getting Started Section */
.getting-started {
  background: var(--background-white);
  padding: 2rem;
  border-radius: 12px;
  box-shadow: 0 4px 20px var(--shadow-light);
  margin: 2rem 0;
}

.getting-started h3 {
  color: var(--primary-blue);
  margin: 1.5rem 0 0.5rem 0;
  font-size: 1.2rem;
  display: flex;
  align-items: center;
}

.getting-started h3::before {
  content: counter(step-counter);
  counter-increment: step-counter;
  background: var(--gradient-primary);
  color: white;
  width: 2rem;
  height: 2rem;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  margin-right: 1rem;
  font-weight: bold;
  font-size: 0.9rem;
}

.getting-started {
  counter-reset: step-counter;
}

/* Responsive Design */
@media (max-width: 768px) {
  body {
    padding: 10px;
  }
  
  h1 {
    font-size: 2rem;
  }
  
  .project-description {
    padding: 1.5rem;
    margin: 1rem 0;
  }
  
  li {
    padding: 0.8rem 1rem;
  }
  
  pre {
    padding: 1rem;
    font-size: 0.8rem;
  }
  
  table {
    font-size: 0.9rem;
  }
  
  th, td {
    padding: 0.75rem;
  }
}

/* Dark mode support */
@media (prefers-color-scheme: dark) {
  :root {
    --text-primary: #e0e0e0;
    --text-secondary: #b0b0b0;
    --background-light: #1a1a1a;
    --background-white: #2d2d2d;
    --border-light: #404040;
    --border-medium: #555555;
    --shadow-light: rgba(0, 0, 0, 0.3);
    --shadow-medium: rgba(0, 0, 0, 0.4);
  }
  
  body {
    background-color: var(--background-light);
    color: var(--text-primary);
  }
  
  code {
    background: #404040;
    color: #e0e0e0;
  }
}

/* Animation for enhanced UX */
@keyframes slideInFromLeft {
  0% {
    opacity: 0;
    transform: translateX(-50px);
  }
  100% {
    opacity: 1;
    transform: translateX(0);
  }
}

.feature-card {
  animation: slideInFromLeft 0.6s ease-out;
}

.feature-card:nth-child(2) { animation-delay: 0.1s; }
.feature-card:nth-child(3) { animation-delay: 0.2s; }
.feature-card:nth-child(4) { animation-delay: 0.3s; }

/* Special styling for Flutter/mobile specific content */
.flutter-badge {
  background: linear-gradient(135deg, #02569b, #075e9e);
  color: white;
  padding: 0.3rem 0.8rem;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  display: inline-block;
  margin: 0.2rem;
}

.tech-stack {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin: 1rem 0;
}

.tech-badge {
  background: var(--background-white);
  border: 1px solid var(--border-light);
  padding: 0.4rem 0.8rem;
  border-radius: 20px;
  font-size: 0.85rem;
  color: var(--text-primary);
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px var(--shadow-light);
}

.tech-badge:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 15px var(--shadow-medium);
  border-color: var(--primary-blue);
}
