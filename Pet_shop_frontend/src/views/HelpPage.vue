<template>
  <div class="help-page">
    <HelpSidebar />
    <HelpContent />
  </div>
</template>

<script setup>
import HelpSidebar from '../components/helpcenter/HelpSidebar.vue';
import HelpContent from '../components/helpcenter/HelpContent.vue';
</script>

<style scoped>
.help-page { display: flex; max-width: 1200px; margin: 0 auto; gap: 20px; }
</style>