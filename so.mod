/*********************************************
 * OPL 12.8.0.0 Model
 * Author: dell-pc
 * Creation Date: 2018年4月12日 at 下午6:10:20
 *********************************************/
int input[1..9][1..9]=...;

//决策变量
dvar boolean x[1..9][1..9][1..9];

//约束
subject to {
	forall(i in 1..9, j in 1..9)
		sum(k in 1..9) x[i][j][k] == 1;
	forall(i in 1..9, k in 1..9)
		sum(j in 1..9) x[i][j][k] == 1;
	forall(j in 1..9, k in 1..9)
		sum(i in 1..9) x[i][j][k] == 1;
	forall(m in 0..2, n in 0..2, k in 1..9)
 		sum(i in 3*m+1..3*m+3, j in 3*n+1..3*n+3) x[i][j][k] == 1;
	forall(i in 1..9, j in 1..9,k in 1..9 : input[i][j]==k) 
		x[i][j][k] == 1;

}

//结果输出
int output[i in 1..9][j in 1..9] = sum(k in 1..9) x[i][j][k]*k;
execute {
	writeln(output);
}
 