<template>
  <footer class="jd-footer">
    <!-- 顶部标语区 -->
    <div class="slogan-container">
      <div class="slogan-item" v-for="(item, index) in footerSlogans" :key="index">
        <div class="slogan-icon">{{ item.icon }}</div>
        <span class="slogan-text">{{ item.title }}</span>
      </div>
    </div>

    <!-- 中间帮助中心链接区 -->
    <div class="links-container">
      <dl class="link-group" v-for="(group, index) in footerLinks" :key="index">
        <dt>{{ group.title }}</dt>
        <dd v-for="(link, lIndex) in group.links" :key="lIndex">
          <a href="#">{{ link }}</a>
        </dd>
      </dl>
    </div>

    <!-- 底部版权及认证信息区 -->
    <div class="copyright-container">
      <p class="about-links">
        <a href="#">关于我们</a> <span style="margin:0 5px">|</span> 
        <a href="#">联系我们</a> <span style="margin:0 5px">|</span> 
        <a href="#">联系客服</a> <span style="margin:0 5px">|</span> 
        <a href="#">合作招商</a> <span style="margin:0 5px">|</span> 
        <a href="#">商家帮助</a> <span style="margin:0 5px">|</span> 
        <a href="#">营销中心</a> <span style="margin:0 5px">|</span> 
        <a href="#">手机宠爱</a> <span style="margin:0 5px">|</span> 
        <a href="#">友情链接</a> <span style="margin:0 5px">|</span> 
        <a href="#">销售联盟</a> <span style="margin:0 5px">|</span> 
        <a href="#">宠爱社区</a> <span style="margin:0 5px">|</span> 
        <a href="#">隐私政策</a>
      </p>
      <p class="copyright-info">
        京公网安备 11000002000088号 | 京ICP备11041704号 | ICP | 药品医疗器械网络信息服务备案<br>
        互联网出版许可证编号新出网证(京)字150号 | 出版物经营许可证 | 违法和不良信息举报电话：4006561155<br>
        Copyright © 2004 - 2024 宠爱有家(PETSHOP) 版权所有 | 消费者维权热线：4006067733 | 经营证照
      </p>
      <div class="trust-badges">
        <span class="badge"><i class="fas fa-shield-alt"></i> 可信网站信用评价</span>
        <span class="badge"><i class="fas fa-user-secret"></i> 网络警察提醒您</span>
        <span class="badge"><i class="fas fa-check-circle"></i> 诚信网站</span>
        <span class="badge"><i class="fas fa-bug"></i> 不良信息举报专区</span>
      </div>
    </div>
  </footer>
</template>

<script setup>
defineProps({
  footerSlogans: {
    type: Array,
    required: true
  },
  footerLinks: {
    type: Array,
    required: true
  }
})
</script>

<style scoped>
.jd-footer {
  background-color: #eaeaea; 
  padding: 30px 0;
  margin-top: 50px;
  border-top: 1px solid #dedede;
}

.slogan-container {
  width: 1200px;
  margin: 0 auto;
  display: flex;
  justify-content: space-around;
  padding-bottom: 30px;
  border-bottom: 1px solid #dedede;
}
.slogan-item { display: flex; align-items: center; }
.slogan-icon {
  width: 36px; height: 36px; line-height: 32px; text-align: center;
  font-size: 22px; font-weight: bold; color: #e4393c; 
  border: 2px solid #e4393c; border-radius: 50%; margin-right: 15px;
}
.slogan-text { font-size: 18px; font-weight: bold; color: #333; }

.links-container {
  width: 1200px; margin: 0 auto; display: flex; justify-content: space-between;
  padding: 20px 0; border-bottom: 1px solid #dedede;
}
.link-group dt { font-size: 14px; font-weight: bold; color: #666; margin-bottom: 10px; }
.link-group dd { margin: 0; line-height: 24px; }
.link-group a { font-size: 12px; color: #666; text-decoration: none; }
.link-group a:hover { color: #e4393c; }

.copyright-container {
  width: 1200px; margin: 20px auto 0; text-align: center;
  color: #999; font-size: 12px;
}
.about-links { margin-bottom: 10px; }
.about-links a { color: #666; text-decoration: none; }
.about-links a:hover { color: #e4393c; }
.copyright-info { line-height: 22px; margin-bottom: 20px; }

.trust-badges { display: flex; justify-content: center; gap: 15px; }
.badge {
  display: inline-flex; align-items: center; border: 1px solid #dedede;
  padding: 5px 10px; border-radius: 3px; background: #fff; color: #666;
}
.badge i { margin-right: 6px; color: #e4393c; font-size: 16px; }

@media (max-width: 1200px) {
  .slogan-container, .links-container, .copyright-container { width: 100%; padding: 0 15px; }
}
</style>