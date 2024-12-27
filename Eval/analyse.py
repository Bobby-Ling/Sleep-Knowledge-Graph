with open("eval_result3.txt", "r", encoding="utf-8") as f:
    lines = f.readlines()
    score_d_total = 0
    score_t_total = 0
    total = len(lines)
    for line in lines:
        score_d = eval(line.split(":")[2].split(",")[0].strip())
        score_t = eval(line.split(":")[-1].strip())
        score_d_total += score_d
        score_t_total += score_t
    print(f"final: score_diease: {score_d_total / total:.2f}, score_treatment: {score_t_total / total:.2f}")