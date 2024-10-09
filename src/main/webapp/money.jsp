<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.LinkedHashMap" %>
<%
    // 获取表单输入数据
    String amountDue = request.getParameter("amountDue");
    String amountPaid = request.getParameter("amountPaid");
    String changeResult = "";

    // 判断是否已输入应付款和实际付款
    if (amountDue != null && amountPaid != null && !amountDue.isEmpty() && !amountPaid.isEmpty()) {
        try {
            int due = Integer.parseInt(amountDue);
            int paid = Integer.parseInt(amountPaid);
            int change = paid - due;

            // 计算找零
            if (change < 0) {
                changeResult = "付款不足！请支付足够金额。";
            } else if (change == 0) {
                changeResult = "没有找零，您支付的金额正好。";
            } else {
                // 面值数组
                int[] denominations = {50, 20, 10, 5, 1};
                LinkedHashMap<Integer, Integer> changeDetails = new LinkedHashMap<>();

                // 计算每种面值的张数
                for (int denom : denominations) {
                    int count = change / denom;
                    if (count > 0) {
                        changeDetails.put(denom, count);
                        change -= denom * count;
                    }
                }

                // 拼接找零信息
                StringBuilder sb = new StringBuilder();
                sb.append("找零总金额：").append(paid - due).append(" 元<br>");
                sb.append("找零详情：<br>");
                for (Integer denom : changeDetails.keySet()) {
                    sb.append(denom).append(" 元: ").append(changeDetails.get(denom)).append(" 张<br>");
                }
                changeResult = sb.toString();
            }
        } catch (NumberFormatException e) {
            changeResult = "输入格式错误，请输入整数金额。";
        }
    }
%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <title>找零计算器</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">
<div class="container mx-auto mt-10">
    <h1 class="text-3xl font-bold text-center mb-5">找零计算器</h1>
    <div class="bg-white p-8 rounded shadow-md max-w-lg mx-auto">
        <form method="GET" action="money.jsp">
            <div class="mb-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="amountDue">
                    应付款 (元)
                </label>
                <input type="text" id="amountDue" name="amountDue"
                       class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       placeholder="请输入应付款金额">
            </div>
            <div class="mb-6">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="amountPaid">
                    实际付款 (元)
                </label>
                <input type="text" id="amountPaid" name="amountPaid"
                       class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                       placeholder="请输入实际付款金额">
            </div>
            <div class="flex items-center justify-between">
                <button type="submit"
                        class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline">
                    计算找零
                </button>
            </div>
        </form>
    </div>
    <div class="mt-10 text-center text-lg bg-green-100 p-4 rounded max-w-lg mx-auto">
        <% if (!changeResult.isEmpty()) { %>
        <div class="text-gray-900">
            <%= changeResult %>
        </div>
        <% } %>
    </div>
</div>
</body>
</html>