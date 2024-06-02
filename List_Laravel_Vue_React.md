Laravel + Vue E-commerce Website - Build and Deploy [jffKw_NMfnw]_56mins.mp4

Table of Contents
------------------------------
00:00:00 - Intro && Demo
00:08:44 - Choice of hosting provider - Hostinger
00:10:23 - Prerequisites
00:11:56 - Get premium shared hosting
00:14:11 - Project Setup
00:20:39 - Database Schema
00:24:00 - Generate models & empty migrations
00:27:01 - Write migrations
00:33:29 - Vue.js project setup
00:35:11 - Add Tailwind.css
00:38:39 - Install Vuex and create store
00:42:21 - Install vue-router and create routes
00:47:33 - Create Login form
00:53:36 - Create password reset form
00:54:34 - Create layout for unauthorized users
01:05:12 - Create Sidebar Layout
01:08:01 - Connect Vue.js to API
01:10:46 - Products CRUD
01:13:56 - Frontend Website, Email Sending
01:19:11 - Prepare helper methods for cart
01:32:01 - Prepare CartController
01:42:51 - Prepare routes for cart
01:46:43 - Create middleware guestOrVerified
01:49:10 - Prepare JavaScript for add to cart
02:00:00 - Add items into cart
02:07:34 - Create cart page 1
02:23:50 - Create cart page 2
02:29:20 - Show subtotal and checkout button
02:34:00 - Implement add to cart from product page
02:39:11 - Customer profile management
02:43:27 - Stripe Checkout
03:58:06 - Create order list page
04:34:24 - Stripe Webhooks
05:12:44 - Order details page
05:32:43 - Orders page in admin
05:37:16 - User management in admin
05:40:17 - Customer management in admin
05:44:38 - Create Dashboard
05:50:43 - Create Reports
05:56:01 - Claim free domain
05:58:26 - Setup Hosting & SSL
06:01:13 - Setup subdomain
06:03:30 - Understand how we are going to deploy
06:07:33 - Connect using SSH
06:12:12 - SSH Basic commands
06:17:01 - Connect with public/private keys
06:26:45 - Install Laravel using SSH
06:35:31 - Create MySQL Database
06:43:10 - Deploy Vue.js Admin
06:50:57 - Create Business Email Address
06:58:50 - Specify Stripe Keys
06:59:43 - Fix bug of creating new product
07:07:45 - Fix Laravel storage issue
07:11:43 - Configure Webhooks
07:16:45 - Outro


🖱️Follow me on social media:🖱️
 

 / thecodeholic  
 

 / thecodeholic  
 

 / thecodeholic  

Check my Github:
https://github.com/thecodeholic

-----------------------------------------------------------------------
++++++++++++++++++++ About vite, tailwind +++++++++++++++++++++++++++++
#### node create vite
npm create vite@latest

#### install tailwindcss
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init -P

#### tailwind.config.js add below configmention:
module.exports = {
	content: [
		content: [
			"./index.html",
			"./srcc/**/*.{vue,js,ts,jsx,tsx}",
		],
	],
	theme: {
		extend: {},
	},
	plugins: [],
}

#### index.css add below configmention:
@tailwind base;
@tailwind components;
@tailwind utilities;

#### install vuex
npm install vuex@next

#### install headlessui & heroicons
npm install @headlessui/vue @heroicons/vue @tailwindcss/forms

#### insert Lock icon:
in Login.vue
<script setup>
import { LockClosedIcon } from '@heroicons/vue/solid'
</script>

#### in Vue.<slot> with <router-view> ...
in components file.
<slot></slot> -> will show call this component's html code.

in app.vue
<router-view></router-view> -> will show which page set by router.


#### in php(laravel -> view.blade.php) call and input variable.
in layouts.index/app/...php
...

in view.blade.php
...

#### in Login.vue
<form class="mt-8 space-y-6" method="POST" @submit.prevent="login">
</form>

#### in GuestLayout.vue
<form class="" @submit.prevent="emit('submit')" method='POST'>
	<slot></slot>
</form>

<script setup>
	function login() {
	  loading.value = true;
	  store.dispatch('login', user)
	    .then(() => {
	      loading.value = false;
	      router.push({name: 'app.dashboard'})
	    })
	    .catch(({response}) => {
	      loading.value = false;
	      errorMsg.value = response.data.message;
	    })
	}
</script>
 
#### password crypt:
*in seed.php
```PHP
public function run()
{
    User::create([
        'name' => 'Admin',
        'email' => 'admin@example.com',
        'password' => bcrypt('admin123'),
        'email_verified_at' => now(),
        'is_admin' => true
    ]);
}

*bcrypt('admin123'),
```

#### verify email:
in Middleware GuestOrVerified.php

class GuestOrVerified extends \Illuminate\Auth\Middleware\EnsureEmailIsVerified


----------------------------------------------------------------------------------------------------------------------
Laravel + React.js Full Stack CRUD and Authentication Project [LxgdcUSFUXA].mp4
https://github.com/derderian7/laravel_react_project/tree/main/laravel_react_project

00:00:00 Introduction
00:01:12 Installation and setup
00:06:40 Setting up the layouts
00:18:11 Context Provider
00:26:45 Auth pages
00:44:01 Auth APIs
01:02:19 Users Page
01:04:40 Users APIs
01:10:00 User Form and table

## about router in react and vue.

```PHP
in vue:

{
    path: '/app',
    name: 'app',
    redirect: '/app/dashboard',
    component: AppLayout,
    meta: {
      requiresAuth: true
    },
    children: [
      {
        path: 'dashboard',
        name: 'app.dashboard',
        component: Dashboard
      },
      {
        path: 'products',
        name: 'app.products',
        component: Products
      },
      ..
    ]
}


in react:

const router = createBrowserRouter ([
{
    path: '/',
    element: <DefaultLayout />,
    children: [
        {
            path: '/users',
            element: <Users />,
        },
        {
            path: '/users/new',
            element: <UserForm key="userCreate"/>
        },
        {
            path: '/users/:id',
            element: <UserForm key="userUpdate" />
        },
    ]
},
















































