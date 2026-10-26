
<template>
  <router-view />
</template>

<style>
/* 全局样式 - 确保整个应用统一 */
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
  background-color: #f5f5f5;
  color: #333;
}

a { 
  text-decoration: none; 
  color: inherit; 
  transition: color 0.3s; 
}

ul { 
  list-style: none; 
  padding: 0; 
  margin: 0; 
}

.container { 
  width: 1200px; 
  margin: 0 auto; 
}

@media (max-width: 1200px) {
  .container { 
    width: 100%; 
    padding: 0 15px; 
  }
}
</style>