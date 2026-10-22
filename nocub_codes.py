import json, sys
p = json.load(open("nocub_plan.json", encoding="utf-8"))[sys.argv[1]]
print(",".join(f["cod"].replace(".", "") for f in p["filas"] if not f["motivo"]))
