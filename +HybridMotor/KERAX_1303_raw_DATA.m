clear
clc

%pressure (Bar)
p = 10*[0.05 0.1 0.15 0.2 0.25	0.3	0.35	0.4	0.45	0.5	0.55 ...
    0.6	0.65	0.7	0.75	0.8	0.85	0.9	0.95	1	1.5	2 ...
    2.5	3	3.5	4	4.5	5	5.5	6];

%% O/F = 2
%flame temp (K)
T_2 = [1446.5241	1448.0664	1449.5629	1451.0213	1452.4447 ...
    1453.8356	1455.1956	1456.5265	1457.8298	1459.1066 ...
    1460.3583	1461.586	1462.7907	1463.9733	1465.1348 ...
    1466.2761	1467.3978	1468.5008	1469.5858	1470.6534 ...
    1480.4941	1489.1104	1496.7987	1503.7558	1510.12 ...
    1515.9924	1521.4494	1526.5504	1531.3424	1535.8634];
%enthalpy (J/mole)
H_2 = 1000*[7.4065	7.4108	7.415	7.4191	7.4231	7.4271	7.431 ...
    7.4348	7.4386	7.4423	7.4459	7.4495	7.453	7.4565	7.4599 ...
    7.4633	7.4666	7.4699	7.4732	7.4764	7.5063	7.5331	7.5575 ...
    7.58	7.6009	7.6205	7.6389	7.6563	7.6729	7.6886];
%entropy (J/(mol·K))
S_2 = 1000*[0.2028	0.1979	0.1951	0.1931	0.1916	0.1904	0.1894 ...
    0.1885	0.1878	0.1871	0.1865	0.186	0.1855	0.185	0.1846 ...
    0.1843	0.1839	0.1836	0.1833	0.183	0.1808	0.1793	0.1783 ...
    0.1775	0.1769	0.1764	0.176	0.1756	0.1753	0.175];
%internal energy (J/mole)
U_2 = 1000*[-3.0022	-3.0095	-3.0166	-3.0235	-3.0302	-3.0368	-3.0432 ...
    -3.0495	-3.0556	-3.0616	-3.0675	-3.0733	-3.079	-3.0845	-3.09 ...
    -3.0954	-3.1006	-3.1058	-3.1109	-3.1159	-3.162	-3.2023	-3.2381 ...
    -3.2704	-3.2999	-3.3271	-3.3523	-3.3758	-3.3979	-3.4187];
%specific heat p const. (J/(kg·K))
CP_2 = 1000*[2.0787	2.0995	2.1198	2.1395	2.1585	2.1771	2.195 ...
    2.2124	2.2294	2.2459	2.2619	2.2775	2.2927	2.3075	2.3219 ...
    2.336	2.3497	2.3632	2.3763	2.3891	2.5032	2.5974	2.677 ...
    2.7457	2.8057	2.8589	2.9064	2.9492	2.988	3.0234];
%specific heat v const.   (J/(kg·K))
CV_2 = 1000*[1.6203	1.6372	1.6538	1.6698	1.6854	1.7004	1.715 ...
    1.7292	1.7429	1.7563	1.7692	1.7818	1.7941	1.8061	1.8177 ...
    1.8291	1.8401	1.8509	1.8614	1.8717	1.963	2.0377	2.1006 ...
    2.1545	2.2014	2.2427	2.2796	2.3126	2.3425	2.3698];
%gas const. (J/(kg·K))
R_2 = 1000*[0.4542	0.4539	0.4537	0.4535	0.4533	0.453	0.4528 ...
    0.4526	0.4524	0.4522	0.452	0.4518	0.4516	0.4514	0.4512 ...
    0.4511	0.4509	0.4507	0.4505	0.4504	0.4488	0.4474	0.4461 ...
    0.445	0.444	0.443	0.4421	0.4413	0.4405	0.4397];
%molecular weight 
MW_2 = [15.8432	15.8524	15.8614	15.8702	15.8788	15.8873	15.8956	15.9038	...
    15.9119	15.9198	15.9276	15.9352	15.9428	15.9502	15.9575	15.9647 ...
    15.9719	15.9789	15.9858	15.9926	16.0566	16.114	16.1663	16.2144 ...
    16.2592	16.301	16.3404	16.3777	16.413	16.4467];
%gamma (ratio of specific heats)
gamma_2 = [1.283	1.2824	1.2818	1.2813	1.2808	1.2803	1.2799 ...
    1.2795	1.2791	1.2788	1.2785	1.2782	1.2779	1.2776	1.2774 ...
    1.2772	1.2769	1.2768	1.2766	1.2764	1.2752	1.2746	1.2744 ...
    1.2744	1.2745	1.2747	1.275	1.2752	1.2755	1.2758];
%kappa (isentropic exponent)
kappa_2 = [1.2823	1.281	1.2798	1.2786	1.2775	1.2764	1.2754	1.2745 ...
    1.2735	1.2727	1.2718	1.271	1.2702	1.2695	1.2687	1.268 ...
    1.2674	1.2667	1.2661	1.2655	1.2604	1.2564	1.2533	1.2507 ...
    1.2485	1.2466	1.245	1.2435	1.2422	1.241];
%density (kg/m^3)
rho_2 = 1000*[0.0001	0.0002	0.0002	0.0003	0.0004	0.0005	0.0005 ...
    0.0006	0.0007	0.0008	0.0008	0.0009	0.001	0.0011	0.0011 ...
    0.0012	0.0013	0.0014	0.0014	0.0015	0.0023	0.003	0.0037 ...
    0.0045	0.0052	0.006	0.0067	0.0074	0.0082	0.0089];

%% O/F = 3
%flame temp (K)
T_3 = [1820.1691	1820.9629	1821.4132	1821.7521	1822.0384 ...
    1822.2949	1822.5325	1822.7571	1822.9724	1823.1807 ...
    1823.3835	1823.582	1823.7768	1823.9686	1824.1578 ...
    1824.3448	1824.5299	1824.7132	1824.895	1825.0755 ...
    1826.8237	1828.502	1830.1307	1831.7183	1833.2698 ...
    1834.7883	1836.2761	1837.735	1839.1666	1840.5722];
%enthalpy (J/mole)
H_3 = 1000*[13.6139	13.616	13.6176	13.6191	13.6204	13.6218	13.6231 ...
    13.6244	13.6257	13.627	13.6283	13.6295	13.6308	13.632	13.6333 ...
    13.6345	13.6358	13.637	13.6382	13.6394	13.6515	13.6633	13.6749 ...
    13.6862	13.6974	13.7083	13.7191	13.7297	13.7401	13.7504];
%entropy (J/(mol·K))
S_3 = 1000*[0.2418	0.2361	0.2328	0.2305	0.2286	0.2272	0.2259 ...
    0.2248	0.2239	0.223	0.2223	0.2216	0.2209	0.2204	0.2198 ...
    0.2193	0.2188	0.2184	0.2179	0.2175	0.2144	0.2122	0.2106 ...
    0.2092	0.2081	0.2072	0.2064	0.2057	0.205	0.2045];
%internal energy (J/mole)
U_3 = 1000*[-1.36	-1.365	-1.3676	-1.3694	-1.3708	-1.372	-1.373 ...
    -1.374	-1.3749	-1.3757	-1.3766	-1.3773	-1.3781	-1.3788	-1.3796 ...
    -1.3803	-1.381	-1.3817	-1.3823	-1.383	-1.3894	-1.3953	-1.4011 ...
    -1.4066	-1.412	-1.4172	-1.4224	-1.4274	-1.4323	-1.4371];
%specific heat p const. (J/(kg·K))
CP_3 = 1000*[1.9818	1.9737	1.9708	1.9697	1.9694	1.9696	1.97 ...
    1.9706	1.9714	1.9722	1.9731	1.9741	1.9751	1.9762	1.9773 ...
    1.9784	1.9795	1.9807	1.9818	1.983	1.9951	2.0073	2.0193 ...
    2.0312	2.0427	2.0541	2.0651	2.0759	2.0864	2.0966];
%specific heat v const.   (J/(kg·K))
CV_3 = 1000*[1.5439	1.5361	1.5333	1.532	1.5315	1.5314	1.5316 ...
    1.532	1.5324	1.533	1.5337	1.5344	1.5351	1.5359	1.5367 ...
    1.5375	1.5383	1.5392	1.5401	1.541	1.5501	1.5595	1.5688 ...
    1.5779	1.5869	1.5956	1.6041	1.6125	1.6206	1.6285];
%gas const. (J/(kg·K))
R_3 = 1000*[0.4353	0.4353	0.4352	0.4352	0.4352	0.4351	0.4351 ...
    0.4351	0.435	0.435	0.435	0.435	0.4349	0.4349	0.4349 ...
    0.4349	0.4348	0.4348	0.4348	0.4347	0.4345	0.4342	0.434 ...
    0.4337	0.4335	0.4332	0.433	0.4328	0.4325	0.4323];
%molecular weight 
MW_3 = [18.8979	18.9008	18.903	18.905	18.907	18.9088	18.9107 ...
    18.9125	18.9143	18.9161	18.9178	18.9196	18.9213	18.9231	18.9248 ...
    18.9265	18.9282	18.9299	18.9316	18.9333	18.9501	18.9664	18.9825 ...
    18.9982	19.0137	19.0289	19.0439	19.0586	19.0731	19.0873];
%gamma (ratio of specific heats)
gamma_3 = [1.2837	1.2849	1.2854	1.2857	1.2859	1.2861	1.2862 ...
    1.2863	1.2864	1.2865	1.2865	1.2866	1.2866	1.2867	1.2867 ...
    1.2867	1.2868	1.2868	1.2868	1.2869	1.287	1.2871	1.2872 ...
    1.2872	1.2873	1.2873	1.2874	1.2874	1.2874	1.2875];
%kappa (isentropic exponent)
kappa_3 = [1.2835	1.2846	1.2851	1.2853	1.2855	1.2856	1.2856	1.2856 ...
    1.2856	1.2856	1.2856	1.2856	1.2856	1.2855	1.2855	1.2854 ...
    1.2854	1.2853	1.2853	1.2852	1.2846	1.284	1.2833	1.2827 ...
    1.282	1.2814	1.2808	1.2802	1.2796	1.2791];
%density (kg/m^3)
rho_3 = 1000*[0.0001	0.0001	0.0002	0.0003	0.0003	0.0004	0.0004 ...
    0.0005	0.0006	0.0006	0.0007	0.0008	0.0008	0.0009	0.0009 ...
    0.001	0.0011	0.0011	0.0012	0.0013	0.0019	0.0025	0.0031 ...
    0.0038	0.0044	0.005	0.0057	0.0063	0.0069	0.0075];

%% O/F = 4
%flame temp (K)
T_4 = [2361.1446	2375.3167	2382.2397	2386.5884	2389.6607 ...
    2391.9865	2393.8298	2395.3393	2396.606	2397.6896 ...
    2398.6308	2399.4587	2400.1946	2400.8545	2401.4509 ...
    2401.9934	2402.4897	2402.9462	2403.3679	2403.7592 ...
    2406.5662	2408.278	2409.4641	2410.3498	2411.0447 ...
    2411.6095	2412.0807	2412.482	2412.8294	2413.1343];
%enthalpy (J/mole)
H_4 = 1000*[18.4701	18.4916	18.5021	18.5087	18.5134	18.5169	18.5198 ...
    18.5221	18.524	18.5257	18.5271	18.5284	18.5295	18.5305	18.5315 ...
    18.5323	18.5331	18.5338	18.5344	18.535	18.5395	18.5422	18.5441 ...
    18.5456	18.5468	18.5478	18.5487	18.5494	18.5501	18.5507];
%entropy (J/(mol·K))
S_4 = 1000*[0.2631	0.2576	0.2544	0.2521	0.2503	0.2488	0.2476 ...
    0.2465	0.2455	0.2447	0.2439	0.2432	0.2426	0.242	0.2414 ...
    0.2409	0.2404	0.2399	0.2395	0.2391	0.2357	0.2334	0.2315 ...
    0.2301	0.2288	0.2277	0.2267	0.2258	0.2251	0.2243];
%internal energy (J/mole)
U_4 = 1000*[-1.1616	-1.2579	-1.305	-1.3345	-1.3554	-1.3712	-1.3837 ...
    -1.3939	-1.4025	-1.4099	-1.4162	-1.4219	-1.4268	-1.4313	-1.4353 ...
    -1.439	-1.4424	-1.4455	-1.4483	-1.451	-1.4699	-1.4814	-1.4893 ...
    -1.4952	-1.4997	-1.5034	-1.5065	-1.5091	-1.5113	-1.5132];
%specific heat p const. (J/(kg·K))
CP_4 = 1000*[2.3148	2.1844	2.1217	2.0827	2.0552	2.0346	2.0182 ...
    2.0049	1.9937	1.9842	1.9759	1.9686	1.9622	1.9564	1.9512 ...
    1.9464	1.9421	1.9381	1.9344	1.931	1.9067	1.8919	1.8817 ...
    1.8741	1.8682	1.8634	1.8594	1.856	1.8531	1.8506];
%specific heat v const.   (J/(kg·K))
CV_4 = 1000*[1.8775	1.7587	1.7016	1.666	1.641	1.6222	1.6073 ...
    1.5952	1.585	1.5763	1.5687	1.5621	1.5562	1.551	1.5462 ...
    1.5419	1.538	1.5343	1.531	1.5279	1.5057	1.4922	1.4829 ...
    1.476	1.4706	1.4662	1.4626	1.4595	1.4569	1.4546];
%gas const. (J/(kg·K))
R_4 = 1000*[0.3926	0.3921	0.3919	0.3918	0.3917	0.3916	0.3915 ...
    0.3915	0.3915	0.3914	0.3914	0.3914	0.3913	0.3913	0.3913 ...
    0.3913	0.3913	0.3913	0.3912	0.3912	0.3911	0.3911	0.391 ...
    0.391	0.391	0.391	0.3909	0.3909	0.3909	0.3909];
%molecular weight 
MW_4 = [21.178	21.2026	21.2147	21.2222	21.2276	21.2317	21.2349	21.2375 ...
    21.2398	21.2417	21.2433	21.2448	21.2461	21.2473	21.2483	21.2493 ...
    21.2502	21.251	21.2517	21.2524	21.2575	21.2606	21.2629	21.2646 ...
    21.266	21.2671	21.2681	21.2689	21.2697	21.2704];
%gamma (ratio of specific heats)
gamma_4 = [1.2329	1.242	1.2469	1.2501	1.2524	1.2542	1.2557 ...
    1.2569	1.2579	1.2588	1.2595	1.2602	1.2608	1.2614	1.2619 ...
    1.2624	1.2628	1.2632	1.2635	1.2639	1.2663	1.2679	1.2689 ...
    1.2697	1.2704	1.2709	1.2713	1.2717	1.272	1.2723];
%kappa (isentropic exponent)
kappa_4 = [1.23	1.2398	1.245	1.2484	1.2508	1.2528	1.2543	1.2556 ...
    1.2567	1.2576	1.2584	1.2592	1.2598	1.2604	1.2609	1.2614 ...
    1.2619	1.2623	1.2627	1.263	1.2656	1.2672	1.2683	1.2692 ...
    1.2698	1.2703	1.2708	1.2712	1.2715	1.2718];
%density (kg/m^3)
rho_4 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0003	0.0003	0.0004 ...
    0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007	0.0008 ...
    0.0009	0.0009	0.001	0.001	0.0011	0.0016	0.0021	0.0027 ...
    0.0032	0.0037	0.0042	0.0048	0.0053	0.0058	0.0064];

%% O/F = 5
%flame temp (K)
T_5 = [2669.1913	2707.9097	2728.7508	2742.6608	2752.9291 ...
    2760.9736	2767.5297	2773.0258	2777.732	2781.8292 ...
    2785.4438	2788.6678	2791.5697	2794.2019	2796.6056 ...
    2798.8133	2800.8513	2802.7412	2804.5007	2806.1448 ...
    2818.2926	2826.0243	2831.5365	2835.7383	2839.0866 ...
    2841.8408	2844.1609	2846.152	2847.8865	2849.4159];
%enthalpy (J/mole)
H_5 = 1000*[22.2574	22.3284	22.3667	22.3923	22.4112	22.4261	22.4382 ...
    22.4484	22.4571	22.4646	22.4713	22.4773	22.4827	22.4876	22.492 ...
    22.4961	22.4999	22.5034	22.5067	22.5097	22.5323	22.5467	22.557 ...
    22.5649	22.5712	22.5764	22.5807	22.5845	22.5878	22.5907];
%entropy (J/(mol·K))
S_5 = 1000*[0.2748	0.2699	0.267	0.2649	0.2633	0.2619	0.2608 ...
    0.2598	0.2589	0.2581	0.2574	0.2567	0.2561	0.2556	0.2551 ...
    0.2546	0.2541	0.2537	0.2533	0.2529	0.2497	0.2475	0.2458 ...
    0.2443	0.2431	0.2421	0.2411	0.2403	0.2395	0.2389];
%internal energy (J/mole)
U_5 = 1000*[0.0645	-0.1865	-0.3214	-0.4115	-0.4779	-0.53	-0.5724 ...
    -0.6079	-0.6383	-0.6648	-0.6882	-0.709	-0.7278	-0.7448	-0.7603 ...
    -0.7745	-0.7877	-0.7999	-0.8113	-0.8219	-0.9003	-0.9502	-0.9857 ...
    -1.0128	-1.0343	-1.052	-1.067	-1.0797	-1.0909	-1.1007];
%specific heat p const. (J/(kg·K))
CP_5 = 1000*[3.375	3.0448	2.8749	2.7645	2.6845	2.6227	2.5729 ...
    2.5315	2.4964	2.466	2.4394	2.4157	2.3946	2.3755	2.3581 ...
    2.3422	2.3275	2.314	2.3014	2.2897	2.2041	2.1505	2.1127 ...
    2.0841	2.0615	2.0429	2.0274	2.0141	2.0026	1.9924];
%specific heat v const.   (J/(kg·K))
CV_5 = 1000*[2.8534	2.5567	2.4041	2.3048	2.2329	2.1773	2.1325 ...
    2.0954	2.0638	2.0364	2.0125	1.9912	1.9722	1.955	1.9393 ...
    1.925	1.9118	1.8997	1.8884	1.8778	1.8008	1.7526	1.7185 ...
    1.6928	1.6724	1.6557	1.6417	1.6298	1.6194	1.6102];
%gas const. (J/(kg·K))
R_5 = 1000*[0.3636	0.3624	0.3618	0.3614	0.3611	0.3609	0.3607 ...
    0.3605	0.3604	0.3602	0.3601	0.36	0.3599	0.3599	0.3598 ...
    0.3597	0.3597	0.3596	0.3596	0.3595	0.3591	0.3589	0.3588 ...
    0.3586	0.3585	0.3584	0.3584	0.3583	0.3583	0.3582];
%molecular weight 
MW_5 = [22.868	22.9409	22.9803	23.0066	23.026	23.0413	23.0537	23.0642 ...
    23.0731	23.0809	23.0878	23.0939	23.0994	23.1045	23.109	23.1132 ...
    23.1171	23.1207	23.1241	23.1272	23.1504	23.1652	23.1758	23.1839 ...
    23.1904	23.1957	23.2002	23.2041	23.2074	23.2104];
%gamma (ratio of specific heats)
gamma_5 = [1.1828	1.1909	1.1958	1.1994	1.2022	1.2045	1.2065 ...
    1.2082	1.2096	1.2109	1.2121	1.2132	1.2142	1.2151	1.2159 ...
    1.2167	1.2174	1.2181	1.2187	1.2193	1.224	1.2271	1.2294 ...
    1.2312	1.2326	1.2339	1.2349	1.2358	1.2366	1.2373];
%kappa (isentropic exponent)
kappa_5 = [1.172	1.1819	1.1879	1.1921	1.1954	1.1981	1.2004	1.2023 ...
    1.204	1.2056	1.2069	1.2082	1.2093	1.2103	1.2113	1.2121 ...
    1.213	1.2137	1.2145	1.2152	1.2204	1.2239	1.2264	1.2284 ...
    1.2301	1.2314	1.2326	1.2336	1.2345	1.2353];
%density (kg/m^3)
rho_5 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0003	0.0003	0.0004 ...
    0.0004	0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007 ...
    0.0008	0.0008	0.0009	0.0009	0.001	0.0015	0.002	0.0025 ...
    0.0029	0.0034	0.0039	0.0044	0.0049	0.0054	0.0059];

%% O/F = 6
%flame temp (K)
T_6 = [2806.6309	2863.9616	2896.5875	2919.2132	2936.4188 ...
    2950.231	2961.7236	2971.5338	2980.0698	2987.6089 ...
    2994.3476	3000.4302	3005.9659	3011.0388	3015.7156 ...
    3020.0496	3024.0842	3027.8553	3031.3926	3034.7214 ...
    3060.0763	3076.9886	3089.4643	3099.2309	3107.185 ...
    3113.8483	3119.5503	3124.5113	3128.8855	3132.7847];
%enthalpy (J/mole)
H_6 = 1000*[25.181	25.2992	25.3666	25.4134	25.449	25.4776	25.5014 ...
    25.5217	25.5394	25.555	25.569	25.5816	25.593	25.6036	25.6132 ...
    25.6222	25.6306	25.6384	25.6458	25.6527	25.7053	25.7404	25.7663 ...
    25.7865	25.8031	25.8169	25.8287	25.8391	25.8482	25.8563];
%entropy (J/(mol·K))
S_6 = 1000*[0.2813	0.2769	0.2742	0.2723	0.2708	0.2696	0.2686 ...
    0.2677	0.2669	0.2662	0.2656	0.265	0.2644	0.2639	0.2634 ...
    0.263	0.2626	0.2622	0.2618	0.2614	0.2586	0.2566	0.255 ...
    0.2537	0.2525	0.2516	0.2507	0.2499	0.2492	0.2486];
%internal energy (J/mole)
U_6 = 1000*[1.8454	1.4869	1.283	1.1417	1.0342	0.948	0.8762 ...
    0.8149	0.7617	0.7146	0.6725	0.6346	0.6	0.5684	0.5392 ...
    0.5121	0.4869	0.4634	0.4413	0.4206	0.2623	0.1568	0.079 ...
    0.0181	-0.0315	-0.0731	-0.1087	-0.1396	-0.1669	-0.1912];
%specific heat p const. (J/(kg·K))
CP_6 = 1000*[4.9483	4.4233	4.1403	3.9505	3.8095	3.6985	3.6074 ...
    3.5307	3.4647	3.4069	3.3557	3.3098	3.2684	3.2307	3.1961 ...
    3.1642	3.1347	3.1072	3.0815	3.0575	2.8776	2.7607	2.6761 ...
    2.6107	2.5581	2.5145	2.4774	2.4454	2.4174	2.3925];
%specific heat v const.   (J/(kg·K))
CV_6 = 1000*[4.2578	3.7929	3.5422	3.3738	3.2487	3.1501	3.0693 ...
    3.0011	2.9424	2.8911	2.8456	2.8048	2.768	2.7344	2.7036 ...
    2.6753	2.649	2.6245	2.6017	2.5803	2.4201	2.3159	2.2404 ...
    2.1821	2.1351	2.0962	2.0631	2.0345	2.0095	1.9873];
%gas const. (J/(kg·K))
R_6 = 1000*[0.3452	0.3436	0.3427	0.3421	0.3416	0.3412	0.3409 ...
    0.3406	0.3404	0.3402	0.34	0.3398	0.3397	0.3395	0.3394 ...
    0.3393	0.3392	0.3391	0.339	0.3389	0.3382	0.3377	0.3374 ...
    0.3371	0.3369	0.3367	0.3366	0.3364	0.3363	0.3362];
%molecular weight 
MW_6 = [24.0838	24.1968	24.2612	24.306	24.34	24.3674	24.3901 ...
    24.4096	24.4265	24.4414	24.4548	24.4668	24.4778	24.4879	24.4972 ...
    24.5057	24.5137	24.5212	24.5282	24.5348	24.5852	24.6187	24.6435 ...
    24.6629	24.6787	24.6919	24.7033	24.7131	24.7218	24.7296];
%gamma (ratio of specific heats)
gamma_6 = [1.1622	1.1662	1.1689	1.1709	1.1726	1.1741	1.1753 ...
    1.1765	1.1775	1.1784	1.1793	1.1801	1.1808	1.1815	1.1821 ...
    1.1828	1.1833	1.1839	1.1844	1.1849	1.1891	1.1921	1.1945 ...
    1.1964	1.1981	1.1995	1.2008	1.202	1.203	1.2039];
%kappa (isentropic exponent)
kappa_6 = [1.1398	1.1466	1.151	1.1542	1.1567	1.1589	1.1607	1.1623 ...
    1.1638	1.1651	1.1663	1.1674	1.1684	1.1693	1.1702	1.1711 ...
    1.1719	1.1726	1.1733	1.174	1.1794	1.1833	1.1863	1.1888 ...
    1.1908	1.1926	1.1942	1.1956	1.1968	1.198];
%density (kg/m^3)
rho_6 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0002	0.0003	0.0003 ...
    0.0004	0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007 ...
    0.0008	0.0008	0.0009	0.0009	0.001	0.0014	0.0019	0.0024 ...
    0.0029	0.0033	0.0038	0.0043	0.0048	0.0052	0.0057];

%% O/F = 7
%flame temp (K)
T_7 = [2850.9061	2916.4474	2954.7072	2981.7425	3002.6184 ...
    3019.5978	3033.8896	3046.2162	3057.0434	3066.6895 ...
    3075.3812	3083.2861	3090.5312	3097.2152	3103.4164 ...
    3109.1977	3114.6107	3119.698	3124.4952	3129.0325 ...
    3164.3878	3188.8587	3207.4432	3222.3482	3234.7411 ...
    3245.3134	3254.5082	3262.6257	3269.8789	3276.424];
%enthalpy (J/mole)
H_7 = 1000*[27.46	27.6084	27.6952	27.7566	27.8041	27.8427	27.8752 ...
    27.9032	27.9279	27.9498	27.9696	27.9876	28.0041	28.0193	28.0335 ...
    28.0466	28.059	28.0705	28.0815	28.0918	28.1723	28.228	28.2703 ...
    28.3042	28.3324	28.3564	28.3773	28.3958	28.4123	28.4271];
%entropy (J/(mol·K))
S_7 = 1000*[0.2848	0.2806	0.2781	0.2763	0.2749	0.2738	0.2728 ...
    0.272	0.2713	0.2706	0.27	0.2695	0.269	0.2685	0.268 ...
    0.2676	0.2672	0.2669	0.2665	0.2662	0.2636	0.2617	0.2603 ...
    0.2591	0.258	0.2571	0.2563	0.2556	0.255	0.2544];
%internal energy (J/mole)
U_7 = 1000*[3.7563	3.3597	3.1284	2.965	2.8389	2.7363	2.65 ...
    2.5756	2.5102	2.4519	2.3995	2.3517	2.308	2.2676	2.2302 ...
    2.1953	2.1626	2.1319	2.1029	2.0755	1.8621	1.7143	1.6021 ...
    1.5121	1.4372	1.3734	1.3178	1.2688	1.2249	1.1854];
%specific heat p const. (J/(kg·K))
CP_7 = 1000*[6.1233	5.562	5.2544	5.0453	4.8881	4.763	4.6594 ...
    4.5714	4.495	4.4276	4.3675	4.3133	4.264	4.2188	4.1771 ...
    4.1385	4.1026	4.0689	4.0374	4.0076	3.7802	3.6268	3.5123 ...
    3.4217	3.3471	3.2841	3.2296	3.1818	3.1393	3.1012];
%specific heat v const.   (J/(kg·K))
CV_7 = 1000*[5.2842	4.7918	4.5219	4.3383	4.2003	4.0904	3.9994 ...
    3.9221	3.8549	3.7957	3.7429	3.6952	3.6519	3.6122	3.5755 ...
    3.5416	3.5099	3.4804	3.4526	3.4264	3.2262	3.0911	2.9903 ...
    2.9104	2.8446	2.789	2.7409	2.6987	2.6612	2.6275];
%gas const. (J/(kg·K))
R_7 = 1000*[0.333	0.3312	0.3302	0.3294	0.3289	0.3284	0.328 ...
    0.3277	0.3274	0.3272	0.3269	0.3267	0.3265	0.3263	0.3262 ...
    0.326	0.3259	0.3257	0.3256	0.3255	0.3246	0.3239	0.3234 ...
    0.3231	0.3227	0.3225	0.3222	0.322	0.3218	0.3217
];
%molecular weight 
MW_7 = [24.9693	25.1042	25.1831	25.2389	25.2821	25.3172	25.3467	25.3722 ...
    25.3947	25.4146	25.4326	25.449	25.464	25.4778	25.4907	25.5026 ...
    25.5138	25.5244	25.5343	25.5437	25.6169	25.6676	25.706	25.7369 ...
    25.7625	25.7843	25.8033	25.8201	25.8351	25.8486];
%gamma (ratio of specific heats)
gamma_7 = [1.1588	1.1607	1.162	1.163	1.1638	1.1644	1.165 ...
    1.1656	1.166	1.1665	1.1669	1.1673	1.1676	1.1679	1.1683 ...
    1.1686	1.1688	1.1691	1.1694	1.1696	1.1717	1.1733	1.1746 ...
    1.1757	1.1766	1.1775	1.1783	1.179	1.1796	1.1803
];
%kappa (isentropic exponent)
kappa_7 = [1.1273	1.132	1.1349	1.137	1.1387	1.1401	1.1413	1.1424 ...
    1.1434	1.1442	1.145	1.1457	1.1464	1.147	1.1476	1.1482 ...
    1.1487	1.1492	1.1497	1.1501	1.1538	1.1564	1.1586	1.1604 ...
    1.1619	1.1632	1.1644	1.1655	1.1665	1.1674
];
%density (kg/m^3)
rho_7 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0003	0.0003	0.0004 ...
    0.0004	0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007 ...
    0.0008	0.0008	0.0009	0.0009	0.001	0.0015	0.0019	0.0024 ...
    0.0029	0.0034	0.0038	0.0043	0.0048	0.0052	0.0057
];

%% O/F = 8
%flame temp (K)
T_8 = [2856.4269	2923.9261	2963.6513	2991.8974	3013.8221 ...
    3031.7358	3046.8757	3059.9824	3071.5344	3081.8591 ...
    3091.1905	3099.7011	3107.5225	3114.7568	3121.485 ...
    3127.7725	3133.6727	3139.2301	3144.4818	3149.4591 ...
    3188.6122	3216.1469	3237.3363	3254.526	3268.9649 ...
    3281.3969	3292.3009	3302.0033	3310.7363	3318.6711
];
%enthalpy (J/mole)
H_8 = 1000*[29.2815	29.4457	29.5427	29.6117	29.6653	29.7092	29.7463	...
    29.7785	29.8068	29.8322	29.8551	29.876	29.8952	29.913	29.9295 ...
    29.945	29.9595	29.9731	29.986	29.9983	30.0946	30.1624	30.2146 ...
    30.257	30.2926	30.3232	30.3501	30.374	30.3955	30.4151
];
%entropy (J/(mol·K))
S_8 = 1000*[0.2868	0.2826	0.2802	0.2785	0.2771	0.276	0.2751 ...
    0.2743	0.2735	0.2729	0.2723	0.2718	0.2713	0.2708	0.2704 ...
    0.27	0.2696	0.2693	0.2689	0.2686	0.2661	0.2643	0.2629 ...
    0.2618	0.2608	0.26	0.2592	0.2585	0.2579	0.2574
];
%internal energy (J/mole)
U_8 = 1000*[5.5318	5.1348	4.9015	4.7356	4.607	4.5019	4.4132 ...
    4.3363	4.2686	4.2081	4.1534	4.1036	4.0578	4.0154	3.976 ...
    3.9392	3.9046	3.8721	3.8413	3.8122	3.583	3.4219	3.2979 ...
    3.1973	3.1129	3.0401	2.9763	2.9196	2.8685	2.8221
];
%specific heat p const. (J/(kg·K))
CP_8 = 1000*[6.5115	5.9791	5.6886	5.4915	5.3437	5.2262	5.129 ...
    5.0465	4.9749	4.9118	4.8555	4.8047	4.7586	4.7163	4.6773 ...
    4.6411	4.6074	4.5759	4.5464	4.5185	4.3052	4.1609	4.0528 ...
    3.9668	3.8958	3.8355	3.7832	3.7371	3.696	3.6589
];
%specific heat v const.   (J/(kg·K))
CV_8 = 1000*[5.6228	5.1563	4.9018	4.7291	4.5996	4.4966	4.4115 ...
    4.3391	4.2764	4.2211	4.1717	4.1272	4.0868	4.0497	4.0155 ...
    3.9838	3.9543	3.9267	3.9008	3.8764	3.6893	3.5628	3.468 ...
    3.3926	3.3304	3.2775	3.2316	3.1912	3.1551	3.1226
];
%gas const. (J/(kg·K))
R_8 = 1000*[0.3242	0.3224	0.3214	0.3206	0.32	0.3196	0.3192 ...
    0.3188	0.3185	0.3183	0.318	0.3178	0.3176	0.3174	0.3172 ...
    0.3171	0.3169	0.3168	0.3166	0.3165	0.3155	0.3148	0.3142 ...
    0.3138	0.3134	0.3131	0.3128	0.3126	0.3124	0.3122
];
%molecular weight 
MW_8 = [25.6427	25.7865	25.8714	25.9318	25.9788	26.0172	26.0497	26.0779 ...
    26.1027	26.1249	26.1449	26.1633	26.1801	26.1956	26.2101	26.2237 ...
    26.2364	26.2483	26.2596	26.2704	26.3547	26.4141	26.4598	26.4969 ...
    26.5281	26.5549	26.5784	26.5994	26.6182	26.6354
];
%gamma (ratio of specific heats)
gamma_8 = [1.1581	1.1596	1.1605	1.1612	1.1618	1.1622	1.1627 ...
    1.163	1.1633	1.1636	1.1639	1.1642	1.1644	1.1646	1.1648 ...
    1.165	1.1652	1.1653	1.1655	1.1657	1.1669	1.1679	1.1686 ...
    1.1692	1.1698	1.1703	1.1707	1.1711	1.1714	1.1718
];
%kappa (isentropic exponent)
kappa_8 = [1.1231	1.1271	1.1294	1.1311	1.1325	1.1336	1.1345	1.1354 ...
    1.1361	1.1368	1.1373	1.1379	1.1384	1.1389	1.1393	1.1397 ...
    1.1401	1.1405	1.1408	1.1411	1.1438	1.1457	1.1471	1.1484 ...
    1.1494	1.1503	1.1511	1.1518	1.1525	1.1531
];
%density (kg/m^3)
rho_8 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0003	0.0003	0.0004 ...
    0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007	0.0008 ...
    0.0008	0.0009	0.0009	0.001	0.001	0.0015	0.002	0.0025 ...
    0.0029	0.0034	0.0039	0.0044	0.0048	0.0053	0.0058
];

%% O/F = 9
%flame temp (K)
T_9 = [2846.1424	2912.9735	2952.3643	2980.4081	3002.2 ...
    3020.0233	3035.1007	3048.1646	3059.6882	3069.9955 ...
    3079.3178	3087.8262	3095.6506	3102.8924	3109.6317 ...
    3115.9333	3121.8503	3127.4265	3132.6987	3137.6982 ...
    3177.1232	3204.9667	3226.471	3243.9714	3258.7134 ...
    3271.4397	3282.629	3292.608	3301.6093	3309.8045
];
%enthalpy (J/mole)
H_9 = 1000*[30.7715	30.9432	31.0448	31.1173	31.1737	31.2199	31.259 ...
    31.2929	31.3228	31.3496	31.3739	31.396	31.4164	31.4352	31.4528 ...
    31.4692	31.4846	31.4992	31.5129	31.526	31.6289	31.7018	31.7581 ...
    31.8039	31.8426	31.876	31.9054	31.9316	31.9552	31.9768
];
%entropy (J/(mol·K))
S_9 = 1000*[0.2879	0.2838	0.2813	0.2796	0.2782	0.2771	0.2762 ...
    0.2754	0.2747	0.274	0.2735	0.2729	0.2724	0.272	0.2716 ...
    0.2712	0.2708	0.2704	0.2701	0.2698	0.2673	0.2655	0.2641 ...
    0.263	0.262	0.2612	0.2605	0.2598	0.2592	0.2587
];
%internal energy (J/mole)
U_9 = 1000*[7.1074	6.7234	6.4975	6.3368	6.212	6.11 ...
    6.0237	5.949	5.8831	5.8242	5.771	5.7223	5.6777 ...
    5.6363	5.5978	5.5619	5.5281	5.4963	5.4662	5.4376 ...
    5.2128	5.0541	4.9317	4.832	4.7481	4.6757	4.612 ...
    4.5553	4.5041	4.4575
];
%specific heat p const. (J/(kg·K))
CP_9 = 1000*[6.4458	5.9452	5.673	5.4889	5.351	5.2415	5.1511 ...
    5.0744	5.008	4.9495	4.8973	4.8503	4.8076	4.7685	4.7325 ...
    4.6991	4.6681	4.639	4.6118	4.5861	4.3901	4.258	4.1594 ...
    4.0812	4.0167	3.9621	3.9147	3.8731	3.836	3.8026
];
%specific heat v const.   (J/(kg·K))
CV_9 = 1000*[5.5727	5.1333	4.8944	4.7327	4.6117	4.5156	4.4363 ...
    4.3689	4.3106	4.2592	4.2134	4.1722	4.1347	4.1003	4.0687 ...
    4.0394	4.0121	3.9867	3.9627	3.9402	3.7681	3.6522	3.5656 ...
    3.4969	3.4403	3.3923	3.3508	3.3143	3.2817	3.2524
];
%gas const. (J/(kg·K))
R_9 = 1000*[0.3177	0.3159	0.3149	0.3141	0.3136	0.3131	0.3127 ...
    0.3124	0.3121	0.3118	0.3116	0.3113	0.3111	0.3109	0.3108 ...
    0.3106	0.3105	0.3103	0.3102	0.3101	0.309	0.3083	0.3078 ...
    0.3073	0.307	0.3066	0.3064	0.3061	0.3059	0.3057
];
%molecular weight 
MW_9 = [26.1746	26.3206	26.407	26.4687	26.5167	26.5559	26.5892	26.6181 ...
    26.6435	26.6663	26.6869	26.7058	26.7231	26.7391	26.7541	26.768 ...
    26.7811	26.7935	26.8052	26.8163	26.9039	26.9658	27.0137	27.0528 ...
    27.0856	27.114	27.139	27.1613	27.1814	27.1998
];
%gamma (ratio of specific heats)
gamma_9 = [1.1567	1.1582	1.1591	1.1598	1.1603	1.1608	1.1611 ...
    1.1615	1.1618	1.1621	1.1623	1.1625	1.1628	1.163	1.1631 ...
    1.1633	1.1635	1.1636	1.1638	1.1639	1.1651	1.1659	1.1665 ...
    1.1671	1.1675	1.1679	1.1683	1.1686	1.1689	1.1692
];
%kappa (isentropic exponent)
kappa_9 = [1.1219	1.1256	1.1279	1.1294	1.1307	1.1317	1.1326	1.1333 ...
    1.134	1.1346	1.1351	1.1356	1.1361	1.1365	1.1369	1.1372 ...
    1.1376	1.1379	1.1382	1.1385	1.1408	1.1425	1.1437	1.1448 ...
    1.1457	1.1464	1.1471	1.1477	1.1483	1.1488
];
%density (kg/m^3)
rho_9 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0003	0.0003	0.0004 ...
    0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007	0.0008 ...
    0.0008	0.0009	0.0009	0.001	0.001	0.0015	0.002	0.0025 ...
    0.003	0.0035	0.004	0.0045	0.005	0.0054	0.0059
];

%% O/F = 10
%flame temp (K)
T_10 = [2828.8338	2893.8775	2932.1658	2959.4029	2980.5558 ...
    2997.8485	3012.4717	3025.1379	3036.3078	3046.2963 ...
    3055.3282	3063.57	3071.148	3078.1605	3084.6854 ...
    3090.7857	3096.5129	3101.9096	3107.0116	3111.8491 ...
    3149.9788	3176.8888	3197.6616	3214.56	3228.7903	3241.0714 ...
    3251.8667	3261.4922	3270.173	3278.075
];
%enthalpy (J/mole)
H_10 = 1000*[32.0123	32.1866	32.2896	32.3631	32.4202	32.467 ...
    32.5066	32.541	32.5713	32.5984	32.6229	32.6454	32.666 ...
    32.6851	32.7028	32.7195	32.7351	32.7498	32.7637	32.7769 ...
    32.8811	32.9548	33.0118	33.0582	33.0973	33.1311	33.1608 ...
    33.1874	33.2113	33.2331
];
%entropy (J/(mol·K))
S_10 = 1000*[0.2886	0.2844	0.2819	0.2801	0.2788	0.2777	0.2767 ...
    0.2759	0.2752	0.2745	0.274	0.2734	0.2729	0.2725	0.272 ...
    0.2716	0.2713	0.2709	0.2706	0.2703	0.2677	0.266	0.2646 ...
    0.2634	0.2624	0.2616	0.2609	0.2602	0.2596	0.259
];
%internal energy (J/mole)
U_10 = 1000*[8.492	8.1255	7.9102	7.7572	7.6385	7.5415	7.4595 ...
    7.3885	7.326	7.2701	7.2195	7.1734	7.131	7.0918	7.0553 ...
    7.0212	6.9892	6.959	6.9305	6.9035	6.6907	6.5406	6.4249 ...
    6.3308	6.2516	6.1833	6.1233	6.0698	6.0216	5.9777
];
%specific heat p const. (J/(kg·K))
CP_10 = 1000*[6.1857	5.7129	5.456	5.2822	5.1521	5.0488	4.9634 ...
    4.891	4.8283	4.7731	4.7238	4.6794	4.6391	4.6022	4.5681 ...
    4.5366	4.5072	4.4798	4.4541	4.4298	4.2445	4.1194	4.026 ...
    3.9519	3.8908	3.8389	3.794	3.7545	3.7193	3.6875
];
%specific heat v const.   (J/(kg·K))
CV_10 = 1000*[5.3558	4.9398	4.7136	4.5607	4.4461	4.3552	4.28 ...
    4.2163	4.1611	4.1124	4.0691	4.03	3.9945	3.962	3.932 ...
    3.9043	3.8784	3.8543	3.8316	3.8103	3.6471	3.537	3.4548 ...
    3.3896	3.3358	3.2901	3.2506	3.2158	3.1848	3.1569
];
%gas const. (J/(kg·K))
R_10 = 1000*[0.3125	0.3108	0.3098	0.3091	0.3086	0.3081	0.3078 ...
    0.3074	0.3071	0.3069	0.3067	0.3064	0.3063	0.3061	0.3059 ...
    0.3058	0.3056	0.3055	0.3053	0.3052	0.3043	0.3036	0.303 ...
    0.3026	0.3023	0.302	0.3017	0.3014	0.3012	0.301
];
%molecular weight 
MW_10 = [26.6056	26.7505	26.8361	26.8971	26.9446	26.9835	27.0164 ...
    27.045	27.0702	27.0927	27.1131	27.1317	27.1489	27.1647	27.1795 ...
    27.1933	27.2063	27.2185	27.2301	27.2411	27.3277	27.3889	27.4363 ...
    27.4748	27.5074	27.5355	27.5602	27.5822	27.6021	27.6202
];
%gamma (ratio of specific heats)
gamma_10 = [1.1549	1.1565	1.1575	1.1582	1.1588	1.1593	1.1597 ...
    1.16	1.1603	1.1606	1.1609	1.1611	1.1614	1.1616	1.1618 ...
    1.162	1.1621	1.1623	1.1625	1.1626	1.1638	1.1647	1.1653 ...
    1.1659	1.1664	1.1668	1.1672	1.1675	1.1678	1.1681
];
%kappa (isentropic exponent)
kappa_10 = [1.122	1.1257	1.1279	1.1295	1.1307	1.1317	1.1326	1.1333 ...
    1.134	1.1346	1.1351	1.1356	1.1361	1.1365	1.1369	1.1372 ...
    1.1376	1.1379	1.1382	1.1385	1.1408	1.1424	1.1437	1.1447 ...
    1.1456	1.1464	1.147	1.1476	1.1482	1.1487
];
%density (kg/m^3)
rho_10 = 1000*[0.0001	0.0001	0.0002	0.0002	0.0003	0.0003	0.0004 ...
    0.0004	0.0005	0.0005	0.0006	0.0006	0.0007	0.0007	0.0008 ...
    0.0008	0.0009	0.0009	0.001	0.0011	0.0016	0.0021	0.0026 ...
    0.0031	0.0036	0.0041	0.0046	0.0051	0.0056	0.0061
];

%% O/F = ALL (Rows = O/F 2-10, Columns = Pressure 0.5 - 60 Bar)
%flame temp (K)
T_ALL = [T_2; T_3; T_4; T_5; T_6; T_7; T_8; T_9; T_10];
%enthalpy (J/mole)
H_ALL = [H_2; H_3; H_4; H_5; H_6; H_7; H_8; H_9; H_10];
%entropy (J/(mol·K))
S_ALL = [S_2; S_3; S_4; S_5; S_6; S_7; S_8; S_9; S_10];
%internal energy (J/mole)
U_ALL = [U_2; U_3; U_4; U_5; U_6; U_7; U_8; U_9; U_10];
%specific heat p const. (J/(kg·K))
CP_ALL = [CP_2; CP_3; CP_4; CP_5; CP_6; CP_7; CP_8; CP_9; CP_10];
%specific heat v const.   (J/(kg·K))
CV_ALL = [CV_2; CV_3; CV_4; CV_5; CV_6; CV_7; CV_8; CV_9; CV_10];
%gas const. (J/(kg·K))
R_ALL = [R_2; R_3; R_4; R_5; R_6; R_7; R_8; R_9; R_10];
%molecular weight  
MW_ALL = [MW_2; MW_3; MW_4; MW_5; MW_6; MW_7; MW_8; MW_9; MW_10];
%gamma (ratio of specific heats)
gamma_ALL = [gamma_2; gamma_3; gamma_4; gamma_5; gamma_6; gamma_7; ...
    gamma_8; gamma_9; gamma_10];
%kappa (isentropic exponent)
kappa_ALL = [kappa_2; kappa_3; kappa_4; kappa_5; kappa_6; kappa_7; ...
    kappa_8; kappa_9; kappa_10];
%density (kg/m^3)
rho_ALL = [rho_2; rho_3; rho_4; rho_5; rho_6; rho_7; rho_8; rho_9; ...
    rho_10];