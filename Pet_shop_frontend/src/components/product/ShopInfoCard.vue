<template>
  <div class="shop-card">
    <div class="shop-header">
      <div class="shop-logo">豪廷</div>
      <div class="shop-name-box">
        <div class="shop-name"><span class="tag-ziying">自营</span> 豪廷宠爱自营旗舰店</div>
      </div>
      <div class="shop-stats">
        <div class="stat-item"><div class="label">累计评价</div><div class="value red">3</div></div>
        <div class="stat-sep">|</div>
        <div class="stat-item"><div class="label">店铺关注</div><div class="value red">10.1万</div></div>
      </div>
    </div>
    <div class="shop-btns">
      <button class="btn-contact"><i class="fas fa-headset"></i> 联系客服</button>
      <button class="btn-enter"><i class="fas fa-store"></i> 进店逛逛</button>
    </div>
  </div>
</template>

<style scoped>
.shop-card { border: 1px solid #eee; padding: 15px; border-radius: 8px; margin-bottom: 20px; background: #fff; }
.shop-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 15px; }
.shop-logo { width: 45px; height: 45px; border: 1px solid #e4393c; color: #e4393c; font-weight: bold; display: flex; align-items: center; justify-content: center; font-size: 18px; border-radius: 4px; }
.shop-name-box { flex: 1; margin-left: 10px; }
.shop-name { font-weight: bold; font-size: 14px; }
.tag-ziying { background: #e4393c; color: #fff; font-size: 12px; padding: 1px 4px; border-radius: 2px; margin-right: 5px; }
.shop-stats { display: flex; align-items: center; gap: 10px; }
.stat-item { text-align: center; }
.stat-sep { color: #eee; }
.label { font-size: 12px; color: #999; }
.value { font-size: 14px; font-weight: bold; }
.red { color: #e4393c; }
.shop-btns { display: flex; gap: 10px; }
.shop-btns button { flex: 1; padding: 8px; border: 1px solid #ddd; background: #f8f8f8; cursor: pointer; border-radius: 4px; font-size: 13px; transition: all 0.2s; }
.shop-btns button:hover { background: #eee; }
</style>