<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div>
        <div>
            机器学习预测：
            <form action="train" method="post" >
                训练参数：
                钢种类型
                <select id="steelType_train" name="steelType_train">
                    <option value="Q235B-Z">Q235B-Z</option>
                    <option value="Q195L">Q195L</option>
                    <option value="Q195-Y">Q195-Y</option>
                    <option value="HRB400E">HRB400E</option>
                </select>
                炉号
                <select id="stoveNum_train" name="stoveNum_train">
                    <option value="1">1号炉</option>
                    <option value="2">2号炉</option>
                </select><br/>
                <tr>
                    <td class="label">输入属性：</td><br/>
                    <td class="controler">
                        <input type="checkbox" name="input_train" value="ingredient_C" checked="checked"> ingredient_C &nbsp;
                        <input type="checkbox" name="input_train" value="ingredient_Si" checked="checked"> ingredient_Si &nbsp;
                        <input type="checkbox" name="input_train" value="ingredient_Mn" checked="checked"> ingredient_Mn &nbsp;
                        <input type="checkbox" name="input_train" value="ingredient_P" checked="checked"> ingredient_P &nbsp;
                        <input type="checkbox" name="input_train" value="ingredient_S" checked="checked"> ingredient_S &nbsp;
                        <input type="checkbox" name="input_train" value="feLiquid_temp" checked="checked"> feLiquid_temp &nbsp;
                        <input type="checkbox" name="input_train" value="fe_caliber" checked="checked"> fe_caliber &nbsp;<br/>
                        <input type="checkbox" name="input_train" value="feLiquid_enclose" checked="checked"> feLiquid_enclose &nbsp;
                        <input type="checkbox" name="input_train" value="feScrapped_enclose" checked="checked"> feScrapped_enclose &nbsp;
                        <input type="checkbox" name="input_train" value="feScrapped_enclose_inner"> feScrapped_enclose_inner &nbsp;
                        <input type="checkbox" name="input_train" value="feLqCons_enclose" checked="checked"> feLqCons_enclose &nbsp;
                        <input type="checkbox" name="input_train" value="feRawCons_enclose" checked="checked"> feRawCons_enclose &nbsp;
                        <input type="checkbox" name="input_train" value="sum_enclose" checked="checked"> sum_enclose &nbsp;
                        <input type="checkbox" name="input_train" value="steelLiquid" checked="checked"> steelLiquid &nbsp;<br/>
                        <input type="checkbox" name="input_train" value="take_probality"> take_probality &nbsp;
                        <input type="checkbox" name="input_train" value="oxygenSupply_time" checked="checked"> oxygenSupply_time &nbsp;
                        <input type="checkbox" name="input_train" value="oxygen_consume" checked="checked"> oxygen_consume &nbsp;
                        <input type="checkbox" name="input_train" value="stove_pull" checked="checked"> stove_pull &nbsp;
                        <input type="checkbox" name="input_train" value="lime_append" checked="checked"> lime_append &nbsp;
                        <input type="checkbox" name="input_train" value="limestone_append" checked="checked"> limestone_append &nbsp;
                        <input type="checkbox" name="input_train" value="dolomite_append" checked="checked"> dolomite_append &nbsp;<br/>
                        <input type="checkbox" name="input_train" value="mineral_append" checked="checked"> mineral_append &nbsp;
                        <input type="checkbox" name="input_train" value="qingshao_append" checked="checked"> qingshao_append &nbsp;
                        <input type="checkbox" name="input_train" value="Mg_append"> Mg_append &nbsp;
                        <input type="checkbox" name="input_train" value="steelLiq_pullTemp1" checked="checked"> steelLiq_pullTemp1 &nbsp;
                        <input type="checkbox" name="input_train" value="steelLiq_addTime"> steelLiq_addTime &nbsp;
                        <input type="checkbox" name="input_train" value="steelLiq_outTemp" checked="checked"> steelLiq_outTemp &nbsp;
                        <input type="checkbox" name="input_train" value="nitrogen_consume" checked="checked"> nitrogen_consume &nbsp;<br/>
                        <input type="checkbox" name="input_train" value="nitrogen_time" checked="checked"> nitrogen_time &nbsp;
                        <input type="checkbox" name="input_train" value="slag_modifier"> slag_modifier &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_SiFe"> alloy_SiFe &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_SiMn" checked="checked"> alloy_SiMn &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_VN"> alloy_VN &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_SiAlFe" checked="checked"> alloy_SiAlFe &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_MnFe_hC" checked="checked"> alloy_MnFe_hC &nbsp;<br/>
                        <input type="checkbox" name="input_train" value="alloy_SiAlCa"> alloy_SiAlCa &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_MnFe_mC"> alloy_MnFe_mC &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_TiFe"> alloy_TiFe &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_NbFe"> alloy_NbFe &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_Al"> alloy_Al &nbsp;
                        <input type="checkbox" name="input_train" value="alloy_carburant" checked="checked"> alloy_carburant &nbsp;
                        <input type="checkbox" name="input_train" value="terminal_C"> terminal_C &nbsp;<br/>
                        <input type="checkbox" name="input_train" value="terminal_S"> terminal_S &nbsp;
                        <input type="checkbox" name="input_train" value="terminal_P"> terminal_P &nbsp;
                        <input type="checkbox" name="input_train" value="terminal_Mn"> terminal_Mn &nbsp;
                        <input type="checkbox" name="input_train" value="steelLiquid_oxygen"> steelLiquid_oxygen &nbsp;
                        <input type="checkbox" name="input_train" value="steelLiquid_dierction" checked="checked"> steelLiquid_dierction &nbsp;
                    </td>
                </tr><br/>
                <tr>
                    <td class="label">输出属性：</td><br/>
                    <td class="controler">
                        <input type="checkbox" name="output_train" value="product_C" checked="checked"> 成品成分（C碳） &nbsp;
                        <input type="checkbox" name="output_train" value="product_Si" checked="checked"> 成品成分（Si硅） &nbsp;
                        <input type="checkbox" name="output_train" value="product_Mn" checked="checked"> 成品成分（Mn锰） &nbsp;
                        <input type="checkbox" name="output_train" value="product_P" checked="checked"> 成品成分（P磷） &nbsp;
                        <input type="checkbox" name="output_train" value="product_S" checked="checked"> 成品成分（S） &nbsp;
                        <input type="checkbox" name="output_train" value="product_PaddS" checked="checked"> 成品成分（P+S之和） &nbsp;
                        <input type="checkbox" name="output_train" value="product_Als" checked="checked"> 成品成分（Als） &nbsp;<br/>
                    </td>
                </tr>
                <input type="submit" value="训练" style="height:20px;width:200px;"/>
            </form>


            <form action="test" method="post" >
                预测参数：
                钢种类型
                <select id="steelType_test" name="steelType_test">
                    <option value="Q235B-Z">Q235B-Z</option>
                    <option value="Q195L">Q195L</option>
                    <option value="Q195-Y">Q195-Y</option>
                    <option value="HRB400E">HRB400E</option>
                </select>
                炉号
                <select id="stoveNum_test" name="stoveNum_test">
                    <option value="1">1号炉</option>
                    <option value="2">2号炉</option>
                </select>
                模型选择：
                <select id="modelSelect_test" name="modelSelect_test">
                    <option value="0">a模型</option>
                    <option value="1">b模型</option>
                    <option value="2">c模型</option>
                    <option value="3">d模型</option>
                </select><br/>
                <input type="submit" value="机器学习预测" style="height:20px;width:200px;"/>
            </form>

            <form action="regression" method="post" >
                线性回归预测：
                钢种类型
                <select id="steelType_regression" name="steelType_regression">
                    <option value="Q235B-Z">Q235B-Z</option>
                    <option value="Q195L">Q195L</option>
                    <option value="Q195-Y">Q195-Y</option>
                    <option value="HRB400E">HRB400E</option>
                </select>
                炉号
                <select id="stoveNum_regression" name="stoveNum_regression">
                    <option value="1">1号炉</option>
                    <option value="2">2号炉</option>
                </select>
                <tr>
                    <td class="label">输入属性：</td><br/>
                    <td class="controler">
                        <input type="checkbox" name="favorite" value="ingredient_C" checked="checked"> ingredient_C &nbsp;
                        <input type="checkbox" name="favorite" value="ingredient_Si" checked="checked"> ingredient_Si &nbsp;
                        <input type="checkbox" name="favorite" value="ingredient_Mn" checked="checked"> ingredient_Mn &nbsp;
                        <input type="checkbox" name="favorite" value="ingredient_P" checked="checked"> ingredient_P &nbsp;
                        <input type="checkbox" name="favorite" value="ingredient_S" checked="checked"> ingredient_S &nbsp;
                        <input type="checkbox" name="favorite" value="feLiquid_temp" checked="checked"> feLiquid_temp &nbsp;
                        <input type="checkbox" name="favorite" value="fe_caliber" checked="checked"> fe_caliber &nbsp;<br/>
                        <input type="checkbox" name="favorite" value="feLiquid_enclose" checked="checked"> feLiquid_enclose &nbsp;
                        <input type="checkbox" name="favorite" value="feScrapped_enclose" checked="checked"> feScrapped_enclose &nbsp;
                        <input type="checkbox" name="favorite" value="feScrapped_enclose_inner"> feScrapped_enclose_inner &nbsp;
                        <input type="checkbox" name="favorite" value="feLqCons_enclose" checked="checked"> feLqCons_enclose &nbsp;
                        <input type="checkbox" name="favorite" value="feRawCons_enclose" checked="checked"> feRawCons_enclose &nbsp;
                        <input type="checkbox" name="favorite" value="sum_enclose" checked="checked"> sum_enclose &nbsp;
                        <input type="checkbox" name="favorite" value="steelLiquid" checked="checked"> steelLiquid &nbsp;<br/>
                        <input type="checkbox" name="favorite" value="take_probality"> take_probality &nbsp;
                        <input type="checkbox" name="favorite" value="oxygenSupply_time" checked="checked"> oxygenSupply_time &nbsp;
                        <input type="checkbox" name="favorite" value="oxygen_consume" checked="checked"> oxygen_consume &nbsp;
                        <input type="checkbox" name="favorite" value="stove_pull" checked="checked"> stove_pull &nbsp;
                        <input type="checkbox" name="favorite" value="lime_append" checked="checked"> lime_append &nbsp;
                        <input type="checkbox" name="favorite" value="limestone_append" checked="checked"> limestone_append &nbsp;
                        <input type="checkbox" name="favorite" value="dolomite_append" checked="checked"> dolomite_append &nbsp;<br/>
                        <input type="checkbox" name="favorite" value="mineral_append" checked="checked"> mineral_append &nbsp;
                        <input type="checkbox" name="favorite" value="qingshao_append" checked="checked"> qingshao_append &nbsp;
                        <input type="checkbox" name="favorite" value="Mg_append"> Mg_append &nbsp;
                        <input type="checkbox" name="favorite" value="steelLiq_pullTemp1" checked="checked"> steelLiq_pullTemp1 &nbsp;
                        <input type="checkbox" name="favorite" value="steelLiq_addTime"> steelLiq_addTime &nbsp;
                        <input type="checkbox" name="favorite" value="steelLiq_outTemp" checked="checked"> steelLiq_outTemp &nbsp;
                        <input type="checkbox" name="favorite" value="nitrogen_consume" checked="checked"> nitrogen_consume &nbsp;<br/>
                        <input type="checkbox" name="favorite" value="nitrogen_time" checked="checked"> nitrogen_time &nbsp;
                        <input type="checkbox" name="favorite" value="slag_modifier"> slag_modifier &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_SiFe"> alloy_SiFe &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_SiMn" checked="checked"> alloy_SiMn &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_VN"> alloy_VN &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_SiAlFe" checked="checked"> alloy_SiAlFe &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_MnFe_hC" checked="checked"> alloy_MnFe_hC &nbsp;<br/>
                        <input type="checkbox" name="favorite" value="alloy_SiAlCa"> alloy_SiAlCa &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_MnFe_mC"> alloy_MnFe_mC &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_TiFe"> alloy_TiFe &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_NbFe"> alloy_NbFe &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_Al"> alloy_Al &nbsp;
                        <input type="checkbox" name="favorite" value="alloy_carburant" checked="checked"> alloy_carburant &nbsp;
                        <input type="checkbox" name="favorite" value="terminal_C"> terminal_C &nbsp;<br/>
                        <input type="checkbox" name="favorite" value="terminal_S"> terminal_S &nbsp;
                        <input type="checkbox" name="favorite" value="terminal_P"> terminal_P &nbsp;
                        <input type="checkbox" name="favorite" value="terminal_Mn"> terminal_Mn &nbsp;
                        <input type="checkbox" name="favorite" value="steelLiquid_oxygen"> steelLiquid_oxygen &nbsp;
                        <input type="checkbox" name="favorite" value="steelLiquid_dierction" checked="checked"> steelLiquid_dierction &nbsp;
                    </td>
                </tr><br/>
                输出属性<select id="outputSelect_regression" name="outputSelect_regression" style="height:20px;width:100px;">
                    <option value="product_C">碳（C）</option>
                    <option value="product_Si">硅（Si）</option>
                    <option value="product_Mn">锰（Mn）</option>
                    <option value="product_P">磷（P）</option>
                    <option value="product_S">硫（S）</option>
                    <option value="product_PaddS">磷硫和（P+S）</option>
                    <option value="product_Als">酸溶铝（Als）</option>
                </select><br/>
                <input type="submit" value="线性回归预测" style="height:20px;width:200px;"/>
            </form>

        </div>
        <div>
            <textarea style="width: 600px; height: 600px">${text}</textarea>
        </div>
    </div>
</body>
</html>


