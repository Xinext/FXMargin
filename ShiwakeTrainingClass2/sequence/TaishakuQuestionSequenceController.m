//
//  TaishakuQuestionSequenceController.m
//  ShiwakeTrainingClass3
//
//  Created by Hiroaki Fujisawa on 2013/01/17.
//  Copyright (c) 2013年 Hiroaki Fujisawa. All rights reserved.
//

#import "TaishakuQuestionSequenceController.h"

@implementation TaishakuQuestionSequenceController

- (id)init
{
	self = [super init];
	if (self != nil) {
		
		// create Question data array
		
		#define QESTION_DATA_NUMBER		130
		
		QuestionStr QuestionData[QESTION_DATA_NUMBER] =
		{
            { "現金" , 0},
            { "当座預金" , 0},
            { "普通預金" , 0},
            { "別段預金" , 0},
            { "受取手形" , 0},
            { "営業外受取手形" , 0},
            { "不渡手形" , 0},
            { "売掛金" , 0},
            { "繰越商品" , 0},
            { "前払金" , 0},
            { "未収金" , 0},
            { "短期貸付金" , 0},
            { "長期貸付金" , 0},
            { "長期前払費用" , 0},
            { "前払費用" , 0},
            { "未収収益" , 0},
            { "仮払金" , 0},
            { "仮払法人税等" , 0},
            { "仮払消費税" , 0},
            { "建物" , 0},
            { "備品" , 0},
            { "車両運搬具" , 0},
            { "機械装置" , 0},
            { "土地" , 0},
            { "売買目的有価証券" , 0},
            { "満期保有目的債券" , 0},
            { "建設仮勘定" , 0},
            { "のれん" , 0},
            { "現金預金" , 0},
            { "電子記録債権" , 0},
            { "クレジット売掛金" , 0},
            { "未収還付法人税等" , 0},
            { "未収還付消費税" , 0},
            { "未収消費税" , 0},
            { "未収入金" , 0},
            { "有価証券" , 0},
            { "仕掛品" , 0},
            { "貯蔵品" , 0},
            { "リース資産" , 0},
            { "工具器具" , 0},
            { "建設仮" , 0},
            { "建設前渡金" , 0},
            { "建設仮払金" , 0},
            { "構築物" , 0},
            { "機械" , 0},
            { "ソフトウェア" , 0},
            { "ソフトウェア仮勘定" , 0},
            { "差入保証金" , 0},
            { "特許権" , 0},
            { "借地権" , 0},
            { "商標権" , 0},
            { "投資有価証券" , 0},
            { "子会社株式" , 0},
            { "関連会社株式" , 0},
            { "その他有価証券" , 0},
            { "前払年金費用" , 0},
            { "退職給付に係る資産" , 0},
            { "関係会社株式" , 0},
            { "銀行預金" , 0},
            { "貸倒引当金" , 0},
            { "商品" , 0},
            { "小口現金" , 0},
            { "定期預金" , 0},
            { "消耗品" , 0},
            { "貸付金" , 0},
            { "手形貸付金" , 0},
            { "従業員貸付金" , 0},
            { "立替金" , 0},
            { "従業員立替金" , 0},
            { "前払手付金" , 0},
            { "支払手付金" , 0},
            { "他店商品券" , 0},
            { "建物減価償却累計額" , 0},
            { "備品減価償却累計額" , 0},
            { "車両運搬具減価償却累計額" , 0},
            { "車両" , 0},
            { "運搬具" , 0},
            
            { "支払手形" , 1},
            { "営業外支払手形" , 1},
            { "買掛金" , 1},
            { "社債" , 1},
            { "未払費用" , 1},
            { "前受収益" , 1},
            { "預り金" , 1},
            { "未払金" , 1},
            { "未払法人税等" , 1},
            { "未払消費税" , 1},
            { "未払配当金" , 1},
            { "短期借入金" , 1},
            { "前受金" , 1},
            { "修繕引当金" , 1},
            { "商品保証引当金" , 1},
            { "売上割戻引当金" , 1},
            { "役員賞与引当金" , 1},
            { "長期借入金" , 1},
            { "退職給付引当金" , 1},
            { "仮受消費税" , 1},
            { "借入金" , 1},
            { "手形借入金" , 1},
            { "当座借越" , 1},
            { "従業員預り金" , 1},
            { "所得税預り金" , 1},
            { "社会保険料預り金" , 1},
            { "仮受金" , 1},
            { "商品券" , 1},
            { "電子記録債務" , 1},
            { "未払固定資産税" , 1},
            { "未払賞与" , 1},
            { "返品調整引当金" , 1},
            { "繰延税金負債" , 1},
            { "役員預り金" , 1},
            { "リース債務" , 1},
            { "預り保証金" , 1},
            { "長期未払金" , 1},
            { "退職給付に係る負債" , 1},
            
            { "資本金" , 2},
            { "資本準備金" , 2},
            { "利益準備金" , 2},
            { "別途積立金" , 2},
            { "株式申込証拠金" , 2},
            { "配当平均積立金" , 2},
            { "繰越利益剰余金" , 2},
            { "引出金" , 2},
            { "その他資本剰余金" , 2},
            { "修繕積立金" , 2},
            { "新築積立金" , 2},
            { "その他有価証券評価差額金" , 2},
            { "非支配株主持分" , 2},
            { "資本剰余金" , 2},
            { "利益剰余金" , 2}
		};
		
		NSArray *kamoku = [NSArray arrayWithObjects:@"資産", @"負債", @"純資産", nil];
		
		[self initData:QuestionData numberOfData:QESTION_DATA_NUMBER kamokuName:kamoku];
	}
	return self;
}

@end