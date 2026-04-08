<template>
  <div class="params-table">
    <div class="table-title">商品详情</div>
    <div class="table-body">
      <div class="row">
        <div class="cell key">品牌</div><div class="cell val">豪廷</div>
        <div class="cell key">商品编号</div><div class="cell val">100153713292</div>
      </div>
      <div class="row">
        <div class="cell key">货号</div><div class="cell val">BCZQ00008</div>
        <div class="cell key">材质</div><div class="cell val">幼体</div>
      </div>
      <div class="row">
        <div class="cell key">包装清单</div><div class="cell val">幼犬活体×1;</div>
      </div>
    </div>
  </div>
</template>

<style scoped>
.params-table { margin-bottom: 20px; border-radius: 8px; overflow: hidden; }
.table-title { font-weight: bold; padding: 10px 0; border-bottom: 1px solid #eee; margin-bottom: 10px; font-size: 16px; }
.table-body { border: 1px solid #eee; border-bottom: none; }
.row { display: flex; border-bottom: 1px solid #eee; font-size: 13px; }
.cell { padding: 10px; display: flex; align-items: center; }
.key { width: 100px; background: #f9f9f9; color: #666; border-right: 1px solid #eee; }
.val { flex: 1; color: #333; border-right: 1px solid #eee; }
.val:last-child { border-right: none; }
</style>