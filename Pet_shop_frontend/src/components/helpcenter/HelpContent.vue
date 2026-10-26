<template>
  <div class="content">
    <h2>售后退款说明</h2>
    <p>退款到账周期为京东退款处理周期加上银行退款处理周期，请您注意查收。</p>
    
    <table>
      <thead>
        <tr>
          <th>支付方式</th>
          <th>退款方式</th>
          <th>京东退款处理周期</th>
          <th>银行退款处理周期</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="(row, index) in tableData" :key="index">
          <td>{{ row.payType }}</td>
          <td>{{ row.refundType }}</td>
          <td>{{ row.jdPeriod }}</td>
          <td>{{ row.bankPeriod }}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script setup>
const tableData = [
  { payType: '在线支付(DC)', refundType: '原返', jdPeriod: '1个工作日', bankPeriod: '1-7个工作日' },
  { payType: '微信支付(余额)', refundType: '原返', jdPeriod: '1个工作日', bankPeriod: '1小时内' },
  // 在此处添加更多数据...
];
</script>

<style scoped>
.content { flex: 1; padding: 20px; }
table { width: 100%; border-collapse: collapse; margin-top: 20px; }
th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
th { background: #b30000; color: white; }
</style>