--����ϵͳ
x888808_g_ScriptId = 888808

x888808_g_BagSpace = 1

x888808_g_AbilityLevel = 1

x888808_g_EnhanceNeedItemList = {20600005, 20600006, 20600045, 20600046, 20600007, 20600008}

x888808_g_Return_Item = {20600005, 20600006, 20600045, 20600046}

x888808_g_LY_String = "&LY(%w)(%w%w%w)(%w%w)(%w)(%w%w%w)(%w%w)(%w)(%w%w%w)(%w%w)"

--�����������
--[�������ID] = {scale = {�ƽ׵�����, ���׵�����, �ؽ׵�����, ��׵�����}}, attr_num = {��չ���������������ѭ����һ��}},
x888808_g_GeneralRule = {
    [20600000] = {scale = {70, 30, 0, 0}, attr_num = {1}},
    [20600001] = {scale = {50, 30, 20, 0}, attr_num = {1, 2}},
    [20600002] = {scale = {50, 0, 70, 30}, attr_num = {1, 2}},
    [20600003] = {scale = {0, 0, 0, 1}, attr_num = {2, 3}},
    [20600004] = {scale = {0, 0, 0, 1}, attr_num = {3}}
}

--��װ������Ϣ
--
x888808_g_KitSkillInfo = {
    [1] = {1764, 1765, 1766, 1767}, 
    [2] = {1768, 1769, 1770, 1771}, 
    [3] = {1772, 1773, 1774, 1775}, 
    [4] = {1776, 1777, 1778, 1779}, 
    [5] = {1780, 1781, 1782, 1783}, 
    [6] = {1784, 1785, 1786, 1787}
}

x888808_g_KitBuffInfo = {
    [1] = {13047, 13048, 13049, 13050}, 
    [2] = {0, 0, 0, 0}, 
    [3] = {0, 0, 0, 0}, 
    [4] = {0, 0, 0, 0}, 
    [5] = {13055, 13056, 13057, 13058}, 
    [6] = {13063, 13064, 13065, 13066}
}

--װ�����ͻ���������Ϣ
--��һά��Ʒ��(1-4�ֱ�Ϊ�ơ������ء���)
--�ڶ�ά��װ������(1-6�ֱ�Ϊ�����̡��ס���������ذ)
--����ά������ֵ, �ֱ�ΪѪ���ޡ��ڹ����⹥���ڷ���������������С����ܡ�����
x888808_g_ProductBaseAttrInfo = {
    [1] = {
        [1] = {1110, 0, 0, 0, 0, 0, 0, 0},
        [2] = {0, 177, 177, 0, 0, 0, 0, 0},
        [3] = {0, 0, 0, 177, 177, 0, 0, 0},
        [4] = {0, 0, 0, 0, 0, 220, 0, 0},
        [5] = {0, 0, 0, 0, 0, 0, 73, 0},
        [6] = {0, 0, 0, 0, 0, 0, 0, 2}
    },
    [2] = {
        [1] = {1876, 0, 0, 0, 0, 0, 0, 0},
        [2] = {0, 299, 299, 0, 0, 0, 0, 0},
        [3] = {0, 0, 0, 299, 299, 0, 0, 0},
        [4] = {0, 0, 0, 0, 0, 372, 0, 0},
        [5] = {0, 0, 0, 0, 0, 0, 124, 0},
        [6] = {0, 0, 0, 0, 0, 0, 0, 4}
    },
    [3] = {
        [1] = {2795, 0, 0, 0, 0, 0, 0, 0},
        [2] = {0, 446, 446, 0, 0, 0, 0, 0},
        [3] = {0, 0, 0, 446, 446, 0, 0, 0},
        [4] = {0, 0, 0, 0, 0, 554, 0, 0},
        [5] = {0, 0, 0, 0, 0, 0, 185, 0},
        [6] = {0, 0, 0, 0, 0, 0, 0, 7}
    },
    [4] = {
        [1] = {3830, 0, 0, 0, 0, 0, 0, 0},
        [2] = {0, 612, 612, 0, 0, 0, 0, 0},
        [3] = {0, 0, 0, 612, 612, 0, 0, 0},
        [4] = {0, 0, 0, 0, 0, 760, 0, 0},
        [5] = {0, 0, 0, 0, 0, 0, 254, 0},
        [6] = {0, 0, 0, 0, 0, 0, 0, 10}
    }
}

--װ��������չ������Ϣ
--[װ������] = {��ӵ�е����Ա��1-30}
--���Ա��  ��Ӧ������
--1	����HP������
--2	����MP������
--3	������
--4	���ֿ�
--5	������
--6	�𹥻�
--7	��ֿ�
--8	����
--9	������
--10	���ֿ�
--11	������
--12	������
--13	���ֿ�
--14	������
--15	������
--16	�������
--17	ħ������
--18	ħ������
--19	����
--20	����
--21	����һ����˫���������İٷֱ�
--22	����
--23	����
--24	����
--25	����
--26	��
--27	���ķ���
--28	�������е�����һ������
--29	�˺�����
--30	�˺�����
x888808_g_ProductExtendedAttrTypeInfo = {
    [1] = {2, 4, 7, 10, 13, 16, 18, 20, 22, 23, 24, 25, 26, 27, 28, 30},
    [2] = {2, 3, 6, 9, 12, 15, 17, 19, 21, 22, 23, 24, 25, 26, 28, 29},
    [3] = {2, 4, 7, 10, 13, 16, 18, 20, 22, 23, 24, 25, 26, 27, 28, 30},
    [4] = {1, 2, 5, 8, 11, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28},
    [5] = {1, 2, 5, 8, 11, 14, 15, 16, 17, 18, 19, 21, 22, 23, 24, 25, 26, 27, 28},
    [6] = {2, 3, 6, 9, 12, 15, 17, 19, 21, 22, 23, 24, 25, 26, 28, 29}
}

--װ��������չ���Ի�׼ֵ��Ϣ
--���Ա��1-30����Ӧ����30�����ԣ������Ա��Ϊ��������
--{����HP������, ����MP������, ������, ���ֿ�, ������, �𹥻�, ��ֿ�, ����, ������, ���ֿ�, ������, ������, ���ֿ�, ������, ������, �������, ħ������, ħ������, ����, ����, ����һ����˫���������İٷֱ�, ����, ����, ����, ����, ��, ���ķ���, �������е�����һ������, �˺�����, �˺�����}
x888808_g_ProductExtendedAttrInfo = {
    [1] = {3300,1700,54,13,13,54,13,13,54,13,13,54,13,13,580,580,580,580,320,110,6,31,31,30,30,17,6,6,80,80},
    [2] = {4200,2200,69,18,18,69,18,18,69,18,18,69,18,18,759,759,759,759,820,260,8,46,46,45,45,22,8,8,110,110},
    [3] = {4500,3000,94,24,24,94,24,24,94,24,24,94,24,24,1058,1058,1058,1058,1150,330,11,56,56,55,55,30,11,11,140,140},
    [4] = {6000,3800,125,30,30,125,30,30,125,30,30,125,30,30,1400,1400,1400,1400,1550,470,14,73,73,72,72,40,14,14,160,160},
}

--����װ��������Ҫ�������ID
--[װ������(1-6�ֱ�Ϊ�����̡��ס���������ذ)] = �����ID
x888808_g_ProductTypeAbilityInfo = {
    [1] = 15, 
    [2] = 15, 
    [3] = 16, 
    [4] = 16, 
    [5] = 17, 
    [6] = 17, 
}

--װ��Ʒ�׼�¼
--[װ��ID] = {product_type = װ������(1-6�ֱ�Ϊ�����̡��ס���������ذ), rank = Ʒ��(1-4�ֱ�Ϊ�ơ������ء���)},
x888808_g_ProductRankInfo = {
    [10157000] = {product_type = 1, rank = 1, kit_type = 1},
    [10157001] = {product_type = 2, rank = 1, kit_type = 1},
    [10157002] = {product_type = 3, rank = 1, kit_type = 1},
    [10157003] = {product_type = 4, rank = 1, kit_type = 1},
    [10157004] = {product_type = 5, rank = 1, kit_type = 1},
    [10157005] = {product_type = 6, rank = 1, kit_type = 1},
    [10157006] = {product_type = 1, rank = 1, kit_type = 2},
    [10157007] = {product_type = 2, rank = 1, kit_type = 2},
    [10157008] = {product_type = 3, rank = 1, kit_type = 2},
    [10157009] = {product_type = 4, rank = 1, kit_type = 2},
    [10157010] = {product_type = 5, rank = 1, kit_type = 2},
    [10157011] = {product_type = 6, rank = 1, kit_type = 2},
    [10157012] = {product_type = 1, rank = 1, kit_type = 3},
    [10157013] = {product_type = 2, rank = 1, kit_type = 3},
    [10157014] = {product_type = 3, rank = 1, kit_type = 3},
    [10157015] = {product_type = 4, rank = 1, kit_type = 3},
    [10157016] = {product_type = 5, rank = 1, kit_type = 3},
    [10157017] = {product_type = 6, rank = 1, kit_type = 3},
    [10157018] = {product_type = 1, rank = 1, kit_type = 4},
    [10157019] = {product_type = 2, rank = 1, kit_type = 4},
    [10157020] = {product_type = 3, rank = 1, kit_type = 4},
    [10157021] = {product_type = 4, rank = 1, kit_type = 4},
    [10157022] = {product_type = 5, rank = 1, kit_type = 4},
    [10157023] = {product_type = 6, rank = 1, kit_type = 4},
    [10157024] = {product_type = 1, rank = 1, kit_type = 5},
    [10157025] = {product_type = 2, rank = 1, kit_type = 5},
    [10157026] = {product_type = 3, rank = 1, kit_type = 5},
    [10157027] = {product_type = 4, rank = 1, kit_type = 5},
    [10157028] = {product_type = 5, rank = 1, kit_type = 5},
    [10157029] = {product_type = 6, rank = 1, kit_type = 5},
    [10157030] = {product_type = 1, rank = 1, kit_type = 6},
    [10157031] = {product_type = 2, rank = 1, kit_type = 6},
    [10157032] = {product_type = 3, rank = 1, kit_type = 6},
    [10157033] = {product_type = 4, rank = 1, kit_type = 6},
    [10157034] = {product_type = 5, rank = 1, kit_type = 6},
    [10157035] = {product_type = 6, rank = 1, kit_type = 6},
    [10157036] = {product_type = 1, rank = 2, kit_type = 1},
    [10157037] = {product_type = 2, rank = 2, kit_type = 1},
    [10157038] = {product_type = 3, rank = 2, kit_type = 1},
    [10157039] = {product_type = 4, rank = 2, kit_type = 1},
    [10157040] = {product_type = 5, rank = 2, kit_type = 1},
    [10157041] = {product_type = 6, rank = 2, kit_type = 1},
    [10157042] = {product_type = 1, rank = 2, kit_type = 2},
    [10157043] = {product_type = 2, rank = 2, kit_type = 2},
    [10157044] = {product_type = 3, rank = 2, kit_type = 2},
    [10157045] = {product_type = 4, rank = 2, kit_type = 2},
    [10157046] = {product_type = 5, rank = 2, kit_type = 2},
    [10157047] = {product_type = 6, rank = 2, kit_type = 2},
    [10157048] = {product_type = 1, rank = 2, kit_type = 3},
    [10157049] = {product_type = 2, rank = 2, kit_type = 3},
    [10157050] = {product_type = 3, rank = 2, kit_type = 3},
    [10157051] = {product_type = 4, rank = 2, kit_type = 3},
    [10157052] = {product_type = 5, rank = 2, kit_type = 3},
    [10157053] = {product_type = 6, rank = 2, kit_type = 3},
    [10157054] = {product_type = 1, rank = 2, kit_type = 4},
    [10157055] = {product_type = 2, rank = 2, kit_type = 4},
    [10157056] = {product_type = 3, rank = 2, kit_type = 4},
    [10157057] = {product_type = 4, rank = 2, kit_type = 4},
    [10157058] = {product_type = 5, rank = 2, kit_type = 4},
    [10157059] = {product_type = 6, rank = 2, kit_type = 4},
    [10157060] = {product_type = 1, rank = 2, kit_type = 5},
    [10157061] = {product_type = 2, rank = 2, kit_type = 5},
    [10157062] = {product_type = 3, rank = 2, kit_type = 5},
    [10157063] = {product_type = 4, rank = 2, kit_type = 5},
    [10157064] = {product_type = 5, rank = 2, kit_type = 5},
    [10157065] = {product_type = 6, rank = 2, kit_type = 5},
    [10157066] = {product_type = 1, rank = 2, kit_type = 6},
    [10157067] = {product_type = 2, rank = 2, kit_type = 6},
    [10157068] = {product_type = 3, rank = 2, kit_type = 6},
    [10157069] = {product_type = 4, rank = 2, kit_type = 6},
    [10157070] = {product_type = 5, rank = 2, kit_type = 6},
    [10157071] = {product_type = 6, rank = 2, kit_type = 6},
    [10157072] = {product_type = 1, rank = 3, kit_type = 1},
    [10157073] = {product_type = 2, rank = 3, kit_type = 1},
    [10157074] = {product_type = 3, rank = 3, kit_type = 1},
    [10157075] = {product_type = 4, rank = 3, kit_type = 1},
    [10157076] = {product_type = 5, rank = 3, kit_type = 1},
    [10157077] = {product_type = 6, rank = 3, kit_type = 1},
    [10157078] = {product_type = 1, rank = 3, kit_type = 2},
    [10157079] = {product_type = 2, rank = 3, kit_type = 2},
    [10157080] = {product_type = 3, rank = 3, kit_type = 2},
    [10157081] = {product_type = 4, rank = 3, kit_type = 2},
    [10157082] = {product_type = 5, rank = 3, kit_type = 2},
    [10157083] = {product_type = 6, rank = 3, kit_type = 2},
    [10157084] = {product_type = 1, rank = 3, kit_type = 3},
    [10157085] = {product_type = 2, rank = 3, kit_type = 3},
    [10157086] = {product_type = 3, rank = 3, kit_type = 3},
    [10157087] = {product_type = 4, rank = 3, kit_type = 3},
    [10157088] = {product_type = 5, rank = 3, kit_type = 3},
    [10157089] = {product_type = 6, rank = 3, kit_type = 3},
    [10157090] = {product_type = 1, rank = 3, kit_type = 4},
    [10157091] = {product_type = 2, rank = 3, kit_type = 4},
    [10157092] = {product_type = 3, rank = 3, kit_type = 4},
    [10157093] = {product_type = 4, rank = 3, kit_type = 4},
    [10157094] = {product_type = 5, rank = 3, kit_type = 4},
    [10157095] = {product_type = 6, rank = 3, kit_type = 4},
    [10157096] = {product_type = 1, rank = 3, kit_type = 5},
    [10157097] = {product_type = 2, rank = 3, kit_type = 5},
    [10157098] = {product_type = 3, rank = 3, kit_type = 5},
    [10157099] = {product_type = 4, rank = 3, kit_type = 5},
    [10157100] = {product_type = 5, rank = 3, kit_type = 5},
    [10157101] = {product_type = 6, rank = 3, kit_type = 5},
    [10157102] = {product_type = 1, rank = 3, kit_type = 6},
    [10157103] = {product_type = 2, rank = 3, kit_type = 6},
    [10157104] = {product_type = 3, rank = 3, kit_type = 6},
    [10157105] = {product_type = 4, rank = 3, kit_type = 6},
    [10157106] = {product_type = 5, rank = 3, kit_type = 6},
    [10157107] = {product_type = 6, rank = 3, kit_type = 6},
    [10157108] = {product_type = 1, rank = 4, kit_type = 1},
    [10157109] = {product_type = 2, rank = 4, kit_type = 1},
    [10157110] = {product_type = 3, rank = 4, kit_type = 1},
    [10157111] = {product_type = 4, rank = 4, kit_type = 1},
    [10157112] = {product_type = 5, rank = 4, kit_type = 1},
    [10157113] = {product_type = 6, rank = 4, kit_type = 1},
    [10157114] = {product_type = 1, rank = 4, kit_type = 2},
    [10157115] = {product_type = 2, rank = 4, kit_type = 2},
    [10157116] = {product_type = 3, rank = 4, kit_type = 2},
    [10157117] = {product_type = 4, rank = 4, kit_type = 2},
    [10157118] = {product_type = 5, rank = 4, kit_type = 2},
    [10157119] = {product_type = 6, rank = 4, kit_type = 2},
    [10157120] = {product_type = 1, rank = 4, kit_type = 3},
    [10157121] = {product_type = 2, rank = 4, kit_type = 3},
    [10157122] = {product_type = 3, rank = 4, kit_type = 3},
    [10157123] = {product_type = 4, rank = 4, kit_type = 3},
    [10157124] = {product_type = 5, rank = 4, kit_type = 3},
    [10157125] = {product_type = 6, rank = 4, kit_type = 3},
    [10157126] = {product_type = 1, rank = 4, kit_type = 4},
    [10157127] = {product_type = 2, rank = 4, kit_type = 4},
    [10157128] = {product_type = 3, rank = 4, kit_type = 4},
    [10157129] = {product_type = 4, rank = 4, kit_type = 4},
    [10157130] = {product_type = 5, rank = 4, kit_type = 4},
    [10157131] = {product_type = 6, rank = 4, kit_type = 4},
    [10157132] = {product_type = 1, rank = 4, kit_type = 5},
    [10157133] = {product_type = 2, rank = 4, kit_type = 5},
    [10157134] = {product_type = 3, rank = 4, kit_type = 5},
    [10157135] = {product_type = 4, rank = 4, kit_type = 5},
    [10157136] = {product_type = 5, rank = 4, kit_type = 5},
    [10157137] = {product_type = 6, rank = 4, kit_type = 5},
    [10157138] = {product_type = 1, rank = 4, kit_type = 6},
    [10157139] = {product_type = 2, rank = 4, kit_type = 6},
    [10157140] = {product_type = 3, rank = 4, kit_type = 6},
    [10157141] = {product_type = 4, rank = 4, kit_type = 6},
    [10157142] = {product_type = 5, rank = 4, kit_type = 6},
    [10157143] = {product_type = 6, rank = 4, kit_type = 6},
}

--[�䷽ID] = {stuff_id = �ر����ϵ�ID, product_type = װ������(1-6�ֱ�Ϊ�����̡��ס���������ذ), product = {�ƽ׵�ID, ���׵�ID, �ؽ׵�ID, ��׵�ID}}, 
x888808_g_CompoundInfo = {
    [1154] = {stuff_id = 20600009, product_type = 1, product = {10157000, 10157036, 10157072, 10157108}},
    [1155] = {stuff_id = 20600010, product_type = 2, product = {10157001, 10157037, 10157073, 10157109}},
    [1156] = {stuff_id = 20600011, product_type = 3, product = {10157002, 10157038, 10157074, 10157110}},
    [1157] = {stuff_id = 20600012, product_type = 4, product = {10157003, 10157039, 10157075, 10157111}},
    [1158] = {stuff_id = 20600013, product_type = 5, product = {10157004, 10157040, 10157076, 10157112}},
    [1159] = {stuff_id = 20600014, product_type = 6, product = {10157005, 10157041, 10157077, 10157113}},
    [1160] = {stuff_id = 20600015, product_type = 1, product = {10157006, 10157042, 10157078, 10157114}},
    [1161] = {stuff_id = 20600016, product_type = 2, product = {10157007, 10157043, 10157079, 10157115}},
    [1162] = {stuff_id = 20600017, product_type = 3, product = {10157008, 10157044, 10157080, 10157116}},
    [1163] = {stuff_id = 20600018, product_type = 4, product = {10157009, 10157045, 10157081, 10157117}},
    [1164] = {stuff_id = 20600019, product_type = 5, product = {10157010, 10157046, 10157082, 10157118}},
    [1165] = {stuff_id = 20600020, product_type = 6, product = {10157011, 10157047, 10157083, 10157119}},
    [1166] = {stuff_id = 20600021, product_type = 1, product = {10157012, 10157048, 10157084, 10157120}},
    [1167] = {stuff_id = 20600022, product_type = 2, product = {10157013, 10157049, 10157085, 10157121}},
    [1168] = {stuff_id = 20600023, product_type = 3, product = {10157014, 10157050, 10157086, 10157122}},
    [1169] = {stuff_id = 20600024, product_type = 4, product = {10157015, 10157051, 10157087, 10157123}},
    [1170] = {stuff_id = 20600025, product_type = 5, product = {10157016, 10157052, 10157088, 10157124}},
    [1171] = {stuff_id = 20600026, product_type = 6, product = {10157017, 10157053, 10157089, 10157125}},
    [1172] = {stuff_id = 20600027, product_type = 1, product = {10157018, 10157054, 10157090, 10157126}},
    [1173] = {stuff_id = 20600028, product_type = 2, product = {10157019, 10157055, 10157091, 10157127}},
    [1174] = {stuff_id = 20600029, product_type = 3, product = {10157020, 10157056, 10157092, 10157128}},
    [1175] = {stuff_id = 20600030, product_type = 4, product = {10157021, 10157057, 10157093, 10157129}},
    [1176] = {stuff_id = 20600031, product_type = 5, product = {10157022, 10157058, 10157094, 10157130}},
    [1177] = {stuff_id = 20600032, product_type = 6, product = {10157023, 10157059, 10157095, 10157131}},
    [1178] = {stuff_id = 20600033, product_type = 1, product = {10157024, 10157060, 10157096, 10157132}},
    [1179] = {stuff_id = 20600034, product_type = 2, product = {10157025, 10157061, 10157097, 10157133}},
    [1180] = {stuff_id = 20600035, product_type = 3, product = {10157026, 10157062, 10157098, 10157134}},
    [1181] = {stuff_id = 20600036, product_type = 4, product = {10157027, 10157063, 10157099, 10157135}},
    [1182] = {stuff_id = 20600037, product_type = 5, product = {10157028, 10157064, 10157100, 10157136}},
    [1183] = {stuff_id = 20600038, product_type = 6, product = {10157029, 10157065, 10157101, 10157137}},
    [1184] = {stuff_id = 20600039, product_type = 1, product = {10157030, 10157066, 10157102, 10157138}},
    [1185] = {stuff_id = 20600040, product_type = 2, product = {10157031, 10157067, 10157103, 10157139}},
    [1186] = {stuff_id = 20600041, product_type = 3, product = {10157032, 10157068, 10157104, 10157140}},
    [1187] = {stuff_id = 20600042, product_type = 4, product = {10157033, 10157069, 10157105, 10157141}},
    [1188] = {stuff_id = 20600043, product_type = 5, product = {10157034, 10157070, 10157106, 10157142}},
    [1189] = {stuff_id = 20600044, product_type = 6, product = {10157035, 10157071, 10157107, 10157143}}
}

x888808_g_ItemCompoundInfo = {
    [20600005] = {
        [20600006] = {money = 20000, count = 4},
		[20600045] = {money = 110000, count = 16},
		[20600046] = {money = 490000, count = 64}
    }, 
    [20600006] = {
		[20600045] = {money = 30000, count = 4},
		[20600046] = {money = 170000, count = 16}
    }, 
    [20600045] = {
		[20600046] = {money = 50000, count = 4}
    }
}

----------------------------------------------------------------------------------------
--	��ת����
----------------------------------------------------------------------------------------
function x888808_LingWu_Operation(sceneId, selfId, operationID, arg1, arg2)

--	AddGlobalCountNews( sceneId,"operationID:"..operationID)
    if operationID == 1 then
        --�����¼����װ��
        x888808_SetSpecialStuff(sceneId, selfId, arg1)
        return
    end
    if operationID == 2 then
        --����װ��
        x888808_TakeOut(sceneId, selfId, arg1, 1)
        return
    end
    if operationID == 3 then
        --����
        x888808_ExtendedEnhance(sceneId, selfId, arg1, arg2)
        return
    end
    if operationID == 4 then
        --�滻��������
        x888808_SaveEnhanced(sceneId, selfId, arg1)
        return
    end
    if operationID == 5 then
        --ת����������
        x888808_TransferEnhanced(sceneId, selfId, arg1, arg2)
        return
    end
    if operationID == 6 then
        --����
        x888808_Disassembly(sceneId, selfId, arg1)
        return
    end
    if operationID == 7 then
        --�ϳ�
        x888808_Synthesis(sceneId, selfId, arg1, arg2)
        return
    end
    if operationID == 8 then
        x888808_UpdateClientOtherLingYuData(sceneId, selfId, arg1)
        return
    end
    if operationID == 9 then
        x888808_Use_LingYu(sceneId, selfId, arg1 - 1)
        return
    end
    if operationID == 10 then
        x888808_UpdateClientLingYuData(sceneId, selfId, 1)
        return
    end
end

----------------------------------------------------------------------------------------
--	��ȡ�������ID
----------------------------------------------------------------------------------------
function x888808_GetSpecialStuff(sceneId, selfId)
    return LuaFnGetGlobalPlayerCacheData(sceneId, selfId, "LingYu", "specialStuff")
end

----------------------------------------------------------------------------------------
--	�����������ID
----------------------------------------------------------------------------------------
function x888808_SetSpecialStuff(sceneId, selfId, itemTableIndex)
    local specialStuff = LuaFnGetItemTableIndexByIndex(sceneId,selfId, itemTableIndex)
    if specialStuff >= 20600000 and specialStuff <= 20600004 then
        LuaFnSetGlobalPlayerCacheData(sceneId, selfId, "LingYu", "specialStuff", specialStuff)
        BeginUICommand(sceneId)
		EndUICommand(sceneId)
		DispatchUICommand(sceneId,selfId, 2023030401)
    end
end

----------------------------------------------------------------------------------------
--	����ʹ�ü�麯��
----------------------------------------------------------------------------------------
function x888808_AbilityCheck(sceneId, selfId, recipeId)
    local CompoundInfo = x888808_g_CompoundInfo[recipeId]
    if not CompoundInfo then
        return OR_ERROR
    end
    if LuaFnGetPropertyBagSpace(sceneId, selfId) < x888808_g_BagSpace then
        return OR_BAG_OUT_OF_SPACE
    end
    local nAbilityID = x888808_g_ProductTypeAbilityInfo[CompoundInfo.product_type]
    local abilityLevel = QueryHumanAbilityLevel(sceneId, selfId, nAbilityID)
    if abilityLevel < x888808_g_AbilityLevel then
        return OR_NO_LEVEL
    end
    local nSpecialStuff = x888808_GetSpecialStuff(sceneId, selfId)
    if not nSpecialStuff then
        return OR_ERROR
    end
    if x888808_g_GeneralRule[nSpecialStuff] == nil then
        return OR_STUFF_LACK
    end
    if not CompoundInfo.stuff_id then
        return OR_STUFF_LACK
    end
    if LuaFnGetAvailableItemCount(sceneId, selfId, nSpecialStuff) >= 1 then
        if LuaFnGetAvailableItemCount(sceneId, selfId, CompoundInfo.stuff_id) >= 1 then
            return OR_OK
        end
    end
    return OR_STUFF_LACK
end

----------------------------------------------------------------------------------------
--	����ܲ�������
----------------------------------------------------------------------------------------
function x888808_AbilityProduce(sceneId, selfId, recipeId)
    local CompoundInfo = x888808_g_CompoundInfo[recipeId]
    if not CompoundInfo then
        return OR_ERROR
    end
    local nAbilityID = x888808_g_ProductTypeAbilityInfo[CompoundInfo.product_type]
    local nSpecialStuff = x888808_GetSpecialStuff(sceneId, selfId)
    if LuaFnGetAvailableItemCount(sceneId, selfId, nSpecialStuff) < 1 then
        return OR_STUFF_LACK
    end
    if LuaFnGetAvailableItemCount(sceneId, selfId, CompoundInfo.stuff_id) < 1 then
        return OR_STUFF_LACK
    end
    LuaFnDelAvailableItem(sceneId, selfId, nSpecialStuff, 1)
    LuaFnDelAvailableItem(sceneId, selfId, CompoundInfo.stuff_id, 1)
    local nItemID = x888808_GetRandomLingyuID(sceneId, selfId, recipeId, nSpecialStuff)
    local nBagPos = LuaFnTryRecieveItem(sceneId, selfId, nItemID, QUALITY_MUST_BE_CHANGE) -- �Ų��¾�û����
    if nBagPos < 0 then
        LuaFnAuditAbility(sceneId, selfId, nAbilityID, recipeId, 0)
        return OR_ERROR
    end
    local nNewAttrNum = x888808_GetRandomExtendedAttrNum(sceneId, selfId, nSpecialStuff)
    local nAttrStr = x888808_GenerateAttrStr(sceneId, selfId, nItemID, nNewAttrNum)
    LuaFnSetItemCreator(sceneId, selfId, nBagPos, nAttrStr)
    LuaFnSendAbilitySuccessMsg(sceneId, selfId, nAbilityID, recipeId, nItemID)
    LuaFnAuditAbility(sceneId, selfId, nAbilityID, recipeId, 1)
    return OR_OK
end

----------------------------------------------------------------------------------------
--	���ݴ�����ϵĹ����������ĳ��Ʒ�׵�ID
----------------------------------------------------------------------------------------
function x888808_GetRandomLingyuID(sceneId, selfId, recipeId, specialStuff)
    local nProductList = {}
    for i = 1, 4 do
        local nNum = x888808_g_GeneralRule[specialStuff].scale[i]
        if nNum == 1 then
            tinsert(nProductList, x888808_g_CompoundInfo[recipeId].product[i])
        elseif nNum > 1 then
            for j = 1, nNum do
                tinsert(nProductList, x888808_g_CompoundInfo[recipeId].product[i])
            end
        end
    end
    for i = 1, 10 do
        nProductList = x888808_ShuffleTable(sceneId, selfId, nProductList)
    end
    return nProductList[random(1, getn(nProductList))]
end

----------------------------------------------------------------------------------------
--	���ݴ�����ϵĹ������������չ����
----------------------------------------------------------------------------------------
function x888808_GetRandomExtendedAttrNum(sceneId, selfId, specialStuff)
    return x888808_ShuffleTable(sceneId, selfId, x888808_g_GeneralRule[specialStuff].attr_num)[1]
end

----------------------------------------------------------------------------------------
--	������ƷID�Լ���չ����������װ����Ϣ�ַ���
----------------------------------------------------------------------------------------
function x888808_GenerateAttrStr(sceneId, selfId, itemId, attrNum)
    local nAttrList = {
        {attr_type = "0", attr = "000", attr_scale = "00"}, 
        {attr_type = "0", attr = "000", attr_scale = "00"}, 
        {attr_type = "0", attr = "000", attr_scale = "00"}, 
    }
    local nProductKit = x888808_g_ProductRankInfo[itemId].kit_type
    local nProductRank = x888808_g_ProductRankInfo[itemId].rank
    local nProductType = x888808_g_ProductRankInfo[itemId].product_type
    local nProductAttr = x888808_g_ProductExtendedAttrTypeInfo[nProductType]
    for i = 1, 10 do
        nProductAttr = x888808_ShuffleTable(sceneId, selfId, nProductAttr)
    end
    local nAttrRate = random(1, 30)
    for i = 1, attrNum do
        local nAttrType = nProductAttr[i]
        local nAttrValue = x888808_g_ProductExtendedAttrInfo[nProductRank][nAttrType]
        nAttrValue = nAttrValue + floor((nAttrValue * nAttrRate)/100)
        nAttrList[i].attr_type = LuaFnBase32Encode(nAttrType)
        nAttrList[i].attr = LuaFnBase32Encode(nAttrValue)
    end
    local nAttrStr = "&LY"
    for i = 1, 3 do
        nAttrStr = nAttrStr .. nAttrList[i].attr_type
        nAttrStr = nAttrStr .. x888808_PadWithZero(nAttrList[i].attr, 3)
        nAttrStr = nAttrStr .. x888808_PadWithZero(nAttrList[i].attr_scale, 2)
    end
    return nAttrStr
end

----------------------------------------------------------------------------------------
--	��ȫ�ַ��������ݴ���Ĳ������ַ�����ȫ��ָ�����ȣ����Ȳ�����ַ�������ǰ�油0
----------------------------------------------------------------------------------------
function x888808_PadWithZero(number, length)
    local number_str = tostring(number)
    local zeros_to_pad = length - strlen(number_str)
    if zeros_to_pad <= 0 then
        return number_str
    else
        local padded_str = ""
        for i = 1, zeros_to_pad do
            padded_str = padded_str.."0"
        end
        return padded_str..number_str
    end
end

----------------------------------------------------------------------------------------
--	ϴ���㷨������һ�����鲢�ҷ��ش��Һ������
----------------------------------------------------------------------------------------
function x888808_ShuffleTable(sceneId, selfId, targetList)
    local tblLen = getn(targetList)
    while (tblLen > 0) do
        local idx = random(1, tblLen)
        targetList[tblLen], targetList[idx] = targetList[idx], targetList[tblLen]
        tblLen = tblLen - 1
    end
    return targetList
end

----------------------------------------------------------------------------------------
--	���Խ��㣬������װ������������
----------------------------------------------------------------------------------------
function x888808_GetLYAttr(sceneId, selfId)
    local nAttr = {
        0,0,0,0,0,0,
        0,0,0,0,0,0,
        0,0,0,0,0,0,
        0,0,0,0,0,0,
        0,0,0,0,0,0
    }
    local nKitData = {}
    local nKitAttrData = {
        {1109, 1952, 3150, 4438}, 
        {10, 17, 28, 40}, 
        {3, 6, 10, 15}, 
        {90, 158, 255, 360}, 
        {270, 475, 766, 1080}, 
        {5, 8, 13, 20}, 
    }
    local nKitExtendedIndex = {1, 31, 21, 20, 19, 28}
    local nBaseExtendedIndex = {1, 17, 15, 18, 16, 19, 20, 21}
    local nLingYuData = LuaFnReadLingYuData(sceneId, selfId)
    for i = 1,6 do
        if not nLingYuData[i].id then
            nLingYuData[i].id = 0
        end
        if not nLingYuData[i].attr then
            nLingYuData[i].attr = ""
        end
        local nLingYuID, nLingYuStr = nLingYuData[i].id, nLingYuData[i].attr
        if nLingYuID and nLingYuID > 0 and x888808_g_ProductRankInfo[nLingYuID] then
            local nLingYuRank, nLingYuType, nLingYuKitType = x888808_g_ProductRankInfo[nLingYuID].rank, x888808_g_ProductRankInfo[nLingYuID].product_type, x888808_g_ProductRankInfo[nLingYuID].kit_type
            local nLingYuBaseAttr = x888808_g_ProductBaseAttrInfo[nLingYuRank][nLingYuType]
            for j = 1, 8 do
                if nLingYuBaseAttr[j] and nLingYuBaseAttr[j] > 0 then
                    
                    if nBaseExtendedIndex[j] then
                        nAttr[nBaseExtendedIndex[j]] = nAttr[nBaseExtendedIndex[j]] + nLingYuBaseAttr[j]
                    end
                end
            end
            local nLingYuData = x888808_ParseAttrStr(sceneId, selfId, nLingYuStr, 1)
            for j = 1, 3 do
                nLingYuData[j].attr = nLingYuData[j].attr + nLingYuData[j].attr * nLingYuData[j].attr_scale/100
                if nLingYuData[j].attr_type and nLingYuData[j].attr_type > 0 then
                    nAttr[nLingYuData[j].attr_type] = nAttr[nLingYuData[j].attr_type] + nLingYuData[j].attr
                end
            end
            if nKitData[nLingYuKitType] == nil then
                nKitData[nLingYuKitType] = {count = 0, level = nLingYuRank}
            end
            nKitData[nLingYuKitType].count = nKitData[nLingYuKitType].count + 1
            if nKitData[nLingYuKitType].level > nLingYuRank then
                nKitData[nLingYuKitType].level = nLingYuRank
            end
        end
    end
    for i = 1,6 do
        if nKitData[i] and nKitData[i].count and 
            nKitData[i].count >= 3 and 
            nKitData[i].level and 
            nKitData[i].level >= 1 and 
            nKitAttrData[i] and 
            nKitAttrData[i][nKitData[i].level] then
            local nTempKitAttrData = nKitAttrData[i][nKitData[i].level]
            if nAttr[nKitExtendedIndex[i]] and nAttr[nKitExtendedIndex[i]] > 0 then
                nAttr[nKitExtendedIndex[i]] = nAttr[nKitExtendedIndex[i]] + nTempKitAttrData
            else
                nAttr[nKitExtendedIndex[i]] = nTempKitAttrData
            end
        end
    end
    if nAttr[28] and nAttr[28] > 0 then
        for i = 22, 26 do
            if nAttr[i] and nAttr[i] > 0 then
                nAttr[i] = nAttr[i] + nAttr[28]
            else
                nAttr[i] = nAttr[28]
            end
        end
    end
    if nAttr[31] and nAttr[31] > 0 then
        local nTempList = {3, 6, 9, 12}
        for i = 1, getn(nTempList) do
            if nAttr[nTempList[i]] and nAttr[nTempList[i]] > 0 then
                nAttr[nTempList[i]] = nAttr[nTempList[i]] + nAttr[31]
            else
                nAttr[nTempList[i]] = nAttr[31]
            end
        end
    end
    nAttr[31] = nil
    for i = 1, 5 do
        local nstr = "Lingyu - "
        for j = 1, 6 do
            local k = ((i - 1) * 6) + j
            nstr = nstr .. format("%d:%d, ",k, nAttr[k])
        end
        --print(nstr)
    end
    if nAttr[29] then
        LuaFnSetGlobalPlayerCacheData(sceneId, selfId, "Lingyu", "DamageEnhance", nAttr[29])
    end
    if nAttr[29] then
        LuaFnSetGlobalPlayerCacheData(sceneId, selfId, "Lingyu", "DamageReduct", nAttr[29])
    end
 	for i = 1, 30 do
	    if nAttr[i] == nil or nAttr[i] < 0 then
	    	nAttr[i] = 0
	    end
	end	   
    return nAttr[1],nAttr[2],nAttr[3],nAttr[4],nAttr[5],nAttr[6],nAttr[7],nAttr[8],nAttr[9],nAttr[10],nAttr[11],nAttr[12],nAttr[13],nAttr[14],nAttr[15],nAttr[16],nAttr[17],nAttr[18],nAttr[19],nAttr[20],nAttr[21],nAttr[22],nAttr[23],nAttr[24],nAttr[25],nAttr[26],nAttr[27],nAttr[28],nAttr[29],nAttr[30]
end

----------------------------------------------------------------------------------------
--	��������װ���ַ���
----------------------------------------------------------------------------------------
function x888808_ParseAttrStr(sceneId, selfId, attrStr, isDeocde)
    local nLingYuData = {
        {attr_type = 0, attr = 0, attr_scale = 0},
        {attr_type = 0, attr = 0, attr_scale = 0},
        {attr_type = 0, attr = 0, attr_scale = 0}
    }
    local nStartPos, nEndPos, nAttrType1, nAttrValue1, nAttrScale1, nAttrType2, nAttrValue2, nAttrScale2, nAttrType3, nAttrValue3, nAttrScale3 = strfind(attrStr, x888808_g_LY_String)
    if nAttrType1 and nAttrValue1 and nAttrScale1 then
        nLingYuData[1].attr_type = (nAttrType1)
        nLingYuData[1].attr = (nAttrValue1)
        nLingYuData[1].attr_scale = (nAttrScale1)
    else
        nLingYuData[1] = {attr_type = "0", attr = "000", attr_scale = "00"}
    end
    if nAttrType2 and nAttrValue2 and nAttrScale2 then
        nLingYuData[2].attr_type = (nAttrType2)
        nLingYuData[2].attr = (nAttrValue2)
        nLingYuData[2].attr_scale = (nAttrScale2)
    else
        nLingYuData[2] = {attr_type = "0", attr = "000", attr_scale = "00"}
    end
    if nAttrType3 and nAttrValue3 and nAttrScale3 then
        nLingYuData[3].attr_type = (nAttrType3)
        nLingYuData[3].attr = (nAttrValue3)
        nLingYuData[3].attr_scale = (nAttrScale3)
    else
        nLingYuData[3] = {attr_type = "0", attr = "000", attr_scale = "00"}
    end
    if isDeocde then
        for i = 1, 3 do
            nLingYuData[i].attr_type = LuaFnBase32Decode(nLingYuData[i].attr_type)
            nLingYuData[i].attr = LuaFnBase32Decode(nLingYuData[i].attr)
            nLingYuData[i].attr_scale = LuaFnBase32Decode(nLingYuData[i].attr_scale)
        end
    end
    return nLingYuData
end

----------------------------------------------------------------------------------------
--	��������ת��
----------------------------------------------------------------------------------------
function x888808_TransferEnhanced(sceneId, selfId, srcPos, destPos)
    if not srcPos or srcPos <= 0 or not destPos or destPos <= 0 then
        return
    end
    local nSrcItem = LuaFnGetItemTableIndexByIndex(sceneId,selfId, srcPos)
    local nDestItem = LuaFnGetItemTableIndexByIndex(sceneId,selfId, destPos)
    if nSrcItem < 10157000 or nSrcItem > 10157143 or nDestItem < 10157000 or nDestItem > 10157143 then
        return
    end
    if (not x888808_g_ProductRankInfo[nSrcItem]) or (not x888808_g_ProductRankInfo[nDestItem])  then
        x888808_NotifyTip(sceneId, selfId, "װ�������쳣��" )
        return
    end
    if x888808_g_ProductRankInfo[nSrcItem].rank ~= x888808_g_ProductRankInfo[nDestItem].rank then
        x888808_NotifyTip(sceneId, selfId, "Ŀ��������Դ�����Ʒ�ײ�һ�£��޷�ת�ƣ�" )
        return
    end
    local _, nSrcStr = LuaFnGetItemCreator(sceneId, selfId, srcPos)
    local _, nDestStr = LuaFnGetItemCreator(sceneId, selfId, destPos)
    if nSrcStr == nil then
	    x888808_NotifyTip(sceneId, selfId, "Դװ�������쳣��" )
	    return
	end
	if nDestStr == nil then
	    x888808_NotifyTip(sceneId, selfId, "Ŀ��װ�������쳣��" )
	    return
	end
	local nNeedMoney = 100000
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < nNeedMoney then
		x888808_NotifyTip( sceneId, selfId,"��Ǯ����")
		return
	end
    local nLingYuData1 = x888808_ParseAttrStr(sceneId, selfId, nSrcStr, 1)
    local nLingYuData2 = x888808_ParseAttrStr(sceneId, selfId, nDestStr, 1)
    local nAttrCount1, nAttrCount2 = 0, 0
    for i = 1, 3 do
        if nLingYuData1[i] and nLingYuData1[i].attr_type and nLingYuData1[i].attr_type > 0 then
			nAttrCount1 = nAttrCount1 + 1
		end
        if nLingYuData2[i] and nLingYuData2[i].attr_type and nLingYuData2[i].attr_type > 0 then
			nAttrCount2 = nAttrCount2 + 1
		end
        nLingYuData1[i].attr_scale, nLingYuData2[i].attr_scale = 0, nLingYuData1[i].attr_scale
    end
    if nAttrCount2 ~= nAttrCount1 then
        x888808_NotifyTip(sceneId, selfId, "Ŀ��������Դ�������չ����������һ�£��޷�ת�ƣ�" )
        return
    end
    nSrcStr = x888808_LingYuData2Str(sceneId, selfId, nLingYuData1, 1)
    nDestStr = x888808_LingYuData2Str(sceneId, selfId, nLingYuData2, 1)
    LuaFnSetItemCreator(sceneId, selfId, srcPos, nSrcStr)
    LuaFnSetItemCreator(sceneId, selfId, destPos, nDestStr)
	x888808_NotifyTip(sceneId, selfId, "��������ת�Ƴɹ���" )
	LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney)
	BeginUICommand(sceneId)
	UICommand_AddString(sceneId, "")--nNewAuthor
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 88880805)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
    return
end

----------------------------------------------------------------------------------------
--	���������滻
----------------------------------------------------------------------------------------
function x888808_SaveEnhanced(sceneId, selfId, nLingYuPos)
	if nLingYuPos == nil or nLingYuPos < 0 then
		return
	end	
	local nItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nLingYuPos)
	if nItemID < 10157000 or nItemID > 10157143 then
		return
	end
    local _, nLingYuAttrStr = LuaFnGetItemCreator(sceneId, selfId, nLingYuPos)
	if not nLingYuAttrStr or strfind(nLingYuAttrStr, "&LY") == nil or strfind(nLingYuAttrStr, "&SX") == nil then
		return
	end
	local nLingYuData = x888808_ParseAttrStr(sceneId, selfId, nLingYuAttrStr)
	local nLingYuScaleData = x888808_ParseScaleStr(sceneId, selfId, nLingYuAttrStr)
	for i = 1, 3 do
		if nLingYuScaleData[i] ~= nil and nLingYuScaleData[i] ~= "00" then
		    nLingYuData[i].attr_scale = nLingYuScaleData[i]
		end
	end
	local nNewLingYuAttrStr = x888808_LingYuData2Str(sceneId, selfId, nLingYuData)
	LuaFnSetItemCreator(sceneId, selfId, nLingYuPos, nNewLingYuAttrStr)
	x888808_NotifyTip(sceneId, selfId, "�ѳɹ��滻�������ԡ�" )
	BeginUICommand(sceneId)
	UICommand_AddString(sceneId, nNewLingYuAttrStr)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId, selfId, 310918488)
end

----------------------------------------------------------------------------------------
--	��������װ���ַ�����������
----------------------------------------------------------------------------------------
function x888808_ParseScaleStr(sceneId, selfId, attrStr)
    local nLingYuData = {
        "00", 
        "00", 
        "00"
    }
    local _, _, nAttrScale1, nAttrScale2, nAttrScale3 = strfind(attrStr, "&SX(%w%w)(%w%w)(%w%w)")
    if nAttrScale1 then
        nLingYuData[1] = nAttrScale1
    end
    if nAttrScale2 then
        nLingYuData[2] = nAttrScale2
    end
    if nAttrScale3 then
        nLingYuData[3] = nAttrScale3
    end
    return nLingYuData
end

----------------------------------------------------------------------------------------
--	�����������
----------------------------------------------------------------------------------------
function x888808_ExtendedEnhance(sceneId, selfId, nLingYuPos, nItemPos)
	if nLingYuPos == nil or nItemPos == nil or nLingYuPos < 0 or nItemPos < 0 then
		return
	end
	local nLingYuID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nLingYuPos)
	if nLingYuID < 10157000 or nLingYuID > 10157143 then
		return
	end
	local nNeedMoney = {10000, 20000, 30000, 50000}
	local nItemID = LuaFnGetItemTableIndexByIndex(sceneId,selfId,nItemPos)
	local nRank = x888808_g_ProductRankInfo[nLingYuID].rank
	nNeedMoney = nNeedMoney[nRank]
	local nFlag = 0
	if nItemID ~= x888808_g_EnhanceNeedItemList[nRank] then
		if nRank == 3 and nItemID == x888808_g_EnhanceNeedItemList[5] then
		    nFlag = 1
		elseif nRank == 4 and nItemID == x888808_g_EnhanceNeedItemList[6] then
		    nFlag = 1
		else
			x888808_NotifyTip(sceneId, selfId, format("#H�����������%s����Ҫ%s��", GetItemName(sceneId, nLingYuID), GetItemName(sceneId, nItemID)))
			return
		end
	end
	local _, nLingYuAttrStr = LuaFnGetItemCreator(sceneId, selfId, nLingYuPos)
	if strfind(nLingYuAttrStr, "&LY") == nil then
		return
	end
	local nHaveItem = LuaFnGetAvailableItemCount(sceneId,selfId,nItemID)
	if nHaveItem < 1 then
		x888808_NotifyTip(sceneId, selfId, format("#H�����������%s����Ҫ1��%s��", GetItemName(sceneId, nLingYuID), GetItemName(sceneId, nItemID)))
		return
	end
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < nNeedMoney then
		x888808_NotifyTip( sceneId, selfId,"��Ǯ����")
		return
	end
	local nLingYuData = x888808_ParseAttrStr(sceneId, selfId, nLingYuAttrStr, 1)
	local nAttrCount = 0
	for i = 1, 3 do
		if nLingYuData[i] and nLingYuData[i].attr_type and nLingYuData[i].attr_type > 0 then
			nAttrCount = nAttrCount + 1
		end
	end
	local nScaleList = {0, 0, 0}
	local nDataset = {}
	for i = 1, 10 do
		for j = 10, 39 do
			tinsert(nDataset, j)
		end
	end
	for i = 1, 5 do
		for j = 40, 50 do
			tinsert(nDataset, j)
		end
	end
	for j = 51, 60 do
		tinsert(nDataset, j)
	end
	nScaleList[1] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
	nScaleList[2] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
	nScaleList[3] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
	if nFlag == 1 then
	    if nRank == 4 then
		local nDataset = {}
		for i = 1, 2 do
			for j = 50, 55 do
				tinsert(nDataset, j)
			end
		end
		for j = 56, 60 do
			tinsert(nDataset, j)
		end
		nScaleList[1] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
		nScaleList[2] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
		local nDataset = {}
		for i = 1, 5 do
			for j = 40, 49 do
				tinsert(nDataset, j)
			end
		end
		for i = 1, 2 do
			for j = 50, 55 do
				tinsert(nDataset, j)
			end
		end
		for j = 56, 60 do
			tinsert(nDataset, j)
		end
		nScaleList[3] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
		if nAttrCount == 3 then
			nScaleList = x888808_ShuffleTable(sceneId, selfId, nScaleList)
		end
		elseif nRank == 3 then
			local nDataset = {}
			for i = 1, 10 do
				for j = 40, 50 do
					tinsert(nDataset, j)
				end
			end
			for j = 51, 60 do
				tinsert(nDataset, j)
			end
			nScaleList[1] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
			nScaleList[2] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
			nScaleList[3] = x888808_ShuffleTable(sceneId, selfId, nDataset)[1]
		end
	end
	nLingYuAttrStr = gsub(nLingYuAttrStr, "&SX%w%w%w%w%w%w", "")
	local nNewAuthor = nLingYuAttrStr .. "&SX"
	for i = 1, 3 do
		nNewAuthor = nNewAuthor .. x888808_PadWithZero(LuaFnBase32Encode(nScaleList[i]), 2)
	end
	LuaFnSetItemCreator(sceneId, selfId, nLingYuPos, nNewAuthor)
	LuaFnDelAvailableItem(sceneId, selfId, nItemID, 1)
	LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney)
	BeginUICommand(sceneId)
	UICommand_AddString(sceneId, nNewAuthor)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId, 310918488)
	LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, 49, 0);
end

----------------------------------------------------------------------------------------
--	�����������ת�ı�
----------------------------------------------------------------------------------------
function x888808_LingYuData2Str(sceneId, selfId, nLingYuData, isEncode)
    for i = 1, 3 do
        if nLingYuData[i] and nLingYuData[i].attr_type and nLingYuData[i].attr and nLingYuData[i].attr_scale then
            if isEncode then
                nLingYuData[i].attr_type = LuaFnBase32Encode(nLingYuData[i].attr_type)
                nLingYuData[i].attr = LuaFnBase32Encode(nLingYuData[i].attr)
                nLingYuData[i].attr_scale = LuaFnBase32Encode(nLingYuData[i].attr_scale)
            end
        else
            nLingYuData[i].attr_type = "0"
            nLingYuData[i].attr = "000"
            nLingYuData[i].attr_scale = "00"
        end
    end
    local nAttrStr = "&LY"
    for i = 1, 3 do
        nAttrStr = nAttrStr .. nLingYuData[i].attr_type
        nAttrStr = nAttrStr .. x888808_PadWithZero(nLingYuData[i].attr, 3)
        nAttrStr = nAttrStr .. x888808_PadWithZero(nLingYuData[i].attr_scale, 2)
    end
    return nAttrStr
end

----------------------------------------------------------------------------------------
--	�����������
----------------------------------------------------------------------------------------
function x888808_TakeOut(sceneId, selfId, index, nIsCancel)
    local nLingYuID, nLingYuStr = LuaFnGetLingYuData(sceneId, selfId, index)
	if nLingYuID and nLingYuID > 0 and x888808_g_ProductRankInfo[nLingYuID] then
		if LuaFnGetPropertyBagSpace(sceneId, selfId) < 1 then
		    x888808_NotifyTip( sceneId, selfId, "#{ResultText_15}" )
		    return
		end
		local nNewPos = LuaFnTryRecieveItem(sceneId, selfId, nLingYuID, 1)
		LuaFnItemBind(sceneId,selfId,nNewPos);
		if nLingYuStr and nLingYuStr ~= "" then
		    LuaFnSetItemCreator(sceneId, selfId, nNewPos, nLingYuStr)
		end
		if nIsCancel == 1 then
		    local nLingYuData = LuaFnReadLingYuData(sceneId, selfId)
		    nLingYuData[index].id = 0
		    nLingYuData[index].attr = "&LY"
		    LuaFnSaveLingYuData(sceneId, selfId, nLingYuData)
		    x888808_UpdateClientLingYuData(sceneId, selfId)
		end
		LuaFnHumanEffectAndAttrFlush(sceneId,selfId)
	end
end

----------------------------------------------------------------------------------------
--	װ���������
----------------------------------------------------------------------------------------
function x888808_Use_LingYu(sceneId, selfId, nLingYuPos)
    if nLingYuPos == nil or nLingYuPos < 0 then
		x888808_NotifyTip( sceneId, selfId, "��Ч���������װ�����޷�������" )
		return
	end
	local nNewLingYuID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nLingYuPos)
	if not nNewLingYuID or nNewLingYuID <= 0 or not x888808_g_ProductRankInfo[nNewLingYuID] then
		--x888808_NotifyTip( sceneId, selfId, "�������װ���쳣���޷�������" )
		return
	end
	if nNewLingYuID and nNewLingYuID > 0 and x888808_g_ProductRankInfo[nNewLingYuID] then
	    local nProductType = x888808_g_ProductRankInfo[nNewLingYuID].product_type
	    local _, nNewLingYuStr =  LuaFnGetItemCreator(sceneId, selfId, nLingYuPos)
	    if nNewLingYuStr == nil then
	        nNewLingYuStr = ""
	    end
	    LuaFnEraseItem(sceneId, selfId, nLingYuPos)
	    local nLingYuData = LuaFnReadLingYuData(sceneId, selfId)
	    if nLingYuData[nProductType] and nLingYuData[nProductType].id > 0 then
	        local nNewPos = LuaFnTryRecieveItem(sceneId, selfId, nLingYuData[nProductType].id, 1)
	        LuaFnItemBind(sceneId,selfId,nNewPos);
	        if nLingYuData[nProductType].attr and nLingYuData[nProductType].attr ~= "" then
	            LuaFnSetItemCreator(sceneId, selfId, nNewPos, nLingYuData[nProductType].attr)
	        end
	    end
	    nLingYuData[nProductType].id = nNewLingYuID
	    nLingYuData[nProductType].attr = nNewLingYuStr
	    LuaFnSaveLingYuData(sceneId, selfId, nLingYuData)
	    x888808_UpdateClientLingYuData(sceneId, selfId)
	    --LuaFnRefreshEngine(sceneId,selfId)
	    LuaFnHumanEffectAndAttrFlush(sceneId,selfId)
	end
end

----------------------------------------------------------------------------------------
--	���������
----------------------------------------------------------------------------------------
function x888808_Disassembly(sceneId, selfId, nLingYuPos)
    if nLingYuPos == nil or nLingYuPos < 0 then
		x888808_NotifyTip( sceneId, selfId, "��Ч���������װ�����޷��һ���" )
		return
	end
	local nLingYuID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nLingYuPos)
	if not nLingYuID or nLingYuID <= 0 or not x888808_g_ProductRankInfo[nLingYuID] or not x888808_g_ProductRankInfo[nLingYuID].rank then
		x888808_NotifyTip( sceneId, selfId, "��Ч���������װ�����޷��һ���" )
		return
	end
	local nRank = x888808_g_ProductRankInfo[nLingYuID].rank
	local nProductID = x888808_g_Return_Item[nRank]
	if not nProductID then
		x888808_NotifyTip( sceneId, selfId, "Ҫ�һ�������Ȫ�쳣���޷��һ���" )
		return
	end
	local nNeedMoney = {20000, 40000, 60000, 100000}
	nNeedMoney = nNeedMoney[nRank]
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < nNeedMoney then
		x888808_NotifyTip( sceneId, selfId,"��Ǯ����")
		return
	end
	LuaFnCostMoneyWithPriority(sceneId, selfId, nNeedMoney)
	LuaFnEraseItem(sceneId, selfId, nLingYuPos)
	LuaFnTryRecieveItem(sceneId, selfId, nProductID, 1)
	x888808_NotifyTip(sceneId, selfId, format("#H�ɹ��һ�һ��%s��", GetItemName(sceneId, nProductID)))
end

----------------------------------------------------------------------------------------
--	���Ϻϳ�
----------------------------------------------------------------------------------------
function x888808_Synthesis(sceneId, selfId, nItemPos, nNewItemID)
    if nItemPos == nil or nItemPos < 0 then
		x888808_NotifyTip( sceneId, selfId, "��Ч������Ȫ���޷��ϳɣ�" )
		return
	end
	local nItemID = LuaFnGetItemTableIndexByIndex(sceneId, selfId, nItemPos)
	if not nItemID or nItemID <= 0 or not x888808_g_ItemCompoundInfo[nItemID] or not x888808_g_ItemCompoundInfo[nItemID][nNewItemID] then
		x888808_NotifyTip( sceneId, selfId, "��Ч������Ȫ���޷��ϳɣ�" )
		return
	end
	if LuaFnGetMaterialBagSpace( sceneId, selfId) < 1 then
		x888808_NotifyTip( sceneId, selfId,"������������Ҫ1����λ")
		return
	end
	local nProductInfo = x888808_g_ItemCompoundInfo[nItemID][nNewItemID]
	local nMoneySelf = GetMoneyJZ(sceneId,selfId) + GetMoney(sceneId,selfId)
	if nMoneySelf < nProductInfo.money then
		x888808_NotifyTip( sceneId, selfId,"��Ǯ����")
		return
	end
	if LuaFnGetAvailableItemCount(sceneId, selfId, nItemID) < nProductInfo.count then
		x888808_NotifyTip(sceneId, selfId, format("%s��������%s����", GetItemName(sceneId, nItemID), nProductInfo.count)) 
		return
	end
	if LuaFnDelAvailableItem(sceneId,selfId, nItemID, nProductInfo.count ) ~= 1 then
		x888808_NotifyTip(sceneId, selfId, format("%s�۳�ʧ�ܡ�", GetItemName(sceneId, nItemID))) 
	    return
	end
	LuaFnCostMoneyWithPriority(sceneId, selfId, nProductInfo.money)
	LuaFnTryRecieveItem(sceneId, selfId, nNewItemID, 1)
	x888808_NotifyTip(sceneId, selfId, format("#H�ɹ��һ�һ��%s��", GetItemName(sceneId, nNewItemID))) 
end

----------------------------------------------------------------------------------------
--	��ҵ�¼��ʼ���������
----------------------------------------------------------------------------------------
function x888808_OnPlayerLogin(sceneId, selfId)
--x888808_NotifyTip( sceneId, selfId,"��ҵ�¼��ʼ���������")
	local nHaveNum1 = LuaFnGetAvailableItemCount(sceneId, selfId, MIdList[1 ])
	local nHaveNum2 = LuaFnGetAvailableItemCount(sceneId, selfId, MIdList[2 ])
	if nHaveNum1 < 1 then
		TryRecieveItem(sceneId, selfId, MIdList[1 ], 1 )	
	end
	if nHaveNum2 < 1 then
		TryRecieveItem(sceneId, selfId, MIdList[2 ], 1 )	
	end

    --CallScriptFunction(888808, "OnPlayerLogin", sceneId, selfId)
    LuaFnReInitLingYuData(sceneId, selfId)
    x888808_UpdateClientLingYuData(sceneId, selfId)
	LuaFnHumanEffectAndAttrFlush(sceneId,selfId)
	x888808_UpdateClientLingYuData(sceneId, selfId)
	
end

----------------------------------------------------------------------------------------
--	���¿ͻ�����������
----------------------------------------------------------------------------------------
function x888808_UpdateClientLingYuData(sceneId, selfId, nIsShow)
    local nKitData = {}
    local nLingYuSkillId = 0
    local nLingYuKitRank = 5
    if nIsShow then
    	nIsShow = 1
    else
    	nIsShow = 0
    end
    BeginUICommand(sceneId)
    for i = 1, 6 do
    	local nLingYuID, nLingYuStr = LuaFnGetLingYuData(sceneId, selfId, i)
    	UICommand_AddInt(sceneId, tonumber(nLingYuID))
		UICommand_AddString(sceneId, nLingYuStr)
		if nLingYuID and nLingYuID > 0 and x888808_g_ProductRankInfo[nLingYuID] and nLingYuStr and nLingYuStr ~= "" then
		    local nLingYuRank = x888808_g_ProductRankInfo[nLingYuID].rank
		    local nLingYuKitType = x888808_g_ProductRankInfo[nLingYuID].kit_type
		    if nKitData[nLingYuKitType] == nil then
                nKitData[nLingYuKitType] = 0
            end
            nKitData[nLingYuKitType] = nKitData[nLingYuKitType] + 1
            if nLingYuKitRank > nLingYuRank then
                nLingYuKitRank = nLingYuRank
            end
		end
    end
    for i = 1, 6 do
		if nKitData[i] and nKitData[i] == 6 then
		    for j = 1, 4 do
                local nSkillID = x888808_g_KitSkillInfo[i][j]
                local nBuffID = x888808_g_KitBuffInfo[i][j]
                if j == nLingYuKitRank then
                    nLingYuSkillId = nSkillID
                    if HaveSkill(sceneId, selfId, nSkillID) ~= 1 then
                        AddSkill(sceneId, selfId, nSkillID)
                    end
                    if LuaFnHaveImpactOfSpecificDataIndex(sceneId, selfId, nBuffID) ~= 1 then
                        LuaFnSendSpecificImpactToUnit(sceneId, selfId, selfId, selfId, nBuffID, 0)
                    end
                else
                    DelSkill(sceneId, selfId, nSkillID)
                    LuaFnCancelSpecificImpact(sceneId, selfId, nSkillID)
                end
		    end
		else
		    for j = 1, 4 do
                DelSkill(sceneId, selfId, x888808_g_KitSkillInfo[i][j])
                LuaFnCancelSpecificImpact(sceneId, selfId, x888808_g_KitBuffInfo[i][j])
		    end
		end
    end
    UICommand_AddInt(sceneId, tonumber(nLingYuSkillId))
    UICommand_AddInt(sceneId, nIsShow)
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,961799378)
end
----------------------------------------------------------------------------------------
--	���¿ͻ�����������
----------------------------------------------------------------------------------------
function x888808_UpdateClientOtherLingYuData(sceneId, selfId, targetId)
	--AddGlobalCountNews(sceneId,"���Խ��:#G"..LuaFnGuid2ObjId(sceneId,targetId)	)--��ӡ����
	local nPlayerTag = LuaFnGetGUID(sceneId, LuaFnGuid2ObjId(sceneId,targetId))
	--AddGlobalCountNews(sceneId,"���Խ��:#G"..nPlayerTag	)--��ӡ����
    local nKitData = {}
    local nLingYuSkillId = 0
    local nLingYuKitRank = 5
    BeginUICommand(sceneId)
    for i = 1, 6 do
    	local nLingYuID, nLingYuStr = LuaFnGetOtherLingYuData(sceneId, nPlayerTag, i)
    	UICommand_AddInt(sceneId, tonumber(nLingYuID))
		UICommand_AddString(sceneId, nLingYuStr)
		if nLingYuID and nLingYuID > 0 and x888808_g_ProductRankInfo[nLingYuID] and nLingYuStr and nLingYuStr ~= "" then
		    local nLingYuRank = x888808_g_ProductRankInfo[nLingYuID].rank
		    local nLingYuKitType = x888808_g_ProductRankInfo[nLingYuID].kit_type
		    if nKitData[nLingYuKitType] == nil then
                nKitData[nLingYuKitType] = 0
            end
            nKitData[nLingYuKitType] = nKitData[nLingYuKitType] + 1
            if nLingYuKitRank > nLingYuRank then
                nLingYuKitRank = nLingYuRank
            end
		end
    end
    for i = 1, 6 do
		if nKitData[i] and nKitData[i] == 6 then
		    for j = 1, 4 do
                local nSkillID = x888808_g_KitSkillInfo[i][j]
                if j == nLingYuKitRank then
                    nLingYuSkillId = nSkillID
                end
		    end
		end
    end
    UICommand_AddInt(sceneId, tonumber(nLingYuSkillId))
	EndUICommand(sceneId)
	DispatchUICommand(sceneId,selfId,961799379)
end

----------------------------------------------------------------------------------------
--	�ͻ�����ʾ
----------------------------------------------------------------------------------------
function x888808_NotifyTip(sceneId, selfId, Msg)
    BeginEvent(sceneId)
    AddText(sceneId, Msg)
    EndEvent(sceneId)
    DispatchMissionTips(sceneId, selfId)
end