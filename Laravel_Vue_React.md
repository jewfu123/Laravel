
About xampp for Laravel + Vue.js in EC area:

1. install xampp on win10

2. cd c:\xampp\htdocs

3. run commands:
	1) composer global require laravel/installer
	2) laravel new laravel-vue-ecommerce

4. install vite.
npm create vite@latest
project name: backend
select -> vue

  cd backend
  npm install
  npm run dev

5. install tailwindcss -> cd backend at first!!!
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -p

6. add js setting.
in tailwind.config.js
 -> content: [
 	"./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
 	]


7. in backend add routes into vue.
npm install -S vue-router@next

npm install vue-router@4

8. in backend install plugin headlessui
npm install @headlessui/vue@latest
npm install -D @headlessui/vue @heroicons/vue @tailwindcss/forms

9. set tailwind.config.js add vue.js
"./src/**/*.{js,ts,jsx,tsx,vue}",
--> add vue then it is ok!!!



10. 















