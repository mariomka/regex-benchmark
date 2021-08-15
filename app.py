# -*- coding: utf-8 -*-

from io import StringIO

import dash
import dash_core_components as dcc
import dash_html_components as html
import pandas as pd
import plotly.express as px

external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]

app = dash.Dash(__name__, external_stylesheets=external_stylesheets)

results = """
**Nim** | 44.07 | 46.55 | 14.34 | 104.97
**Nim Regex** | 2.50 | 88.77 | 17.93 | 109.20
**PHP** | 78.59 | 86.24 | 9.52 | 174.35
**Javascript** | 118.42 | 88.01 | 2.34 | 208.77
**Rust** | 116.84 | 94.81 | 9.16 | 220.81
**C++ Boost** | 139.13 | 126.89 | 42.39 | 308.41
**Julia** | 194.62 | 162.02 | 9.45 | 366.08
**Perl** | 186.44 | 128.53 | 83.38 | 398.35
**Dart** | 201.82 | 199.55 | 224.69 | 626.06
**C# .Net Core** | 361.52 | 323.43 | 107.73 | 792.68
**C PCRE2** | 419.03 | 368.10 | 33.83 | 820.96
**Crystal** | 451.80 | 392.16 | 34.69 | 878.65
**Python PyPy2** | 351.30 | 303.54 | 511.74 | 1166.57
**Ruby** | 597.89 | 520.46 | 91.19 | 1209.55
**D dmd** | 628.58 | 639.69 | 13.79 | 1282.06
**D ldc** | 698.96 | 688.56 | 13.23 | 1400.75
**Python PyPy3** | 489.34 | 462.58 | 502.83 | 1454.75
**Kotlin** | 351.61 | 431.46 | 1091.66 | 1874.72
**Java** | 332.39 | 439.02 | 1135.27 | 1906.68
**Go** | 559.41 | 540.93 | 934.77 | 2035.11
**Python 2** | 1304.20 | 447.38 | 1735.99 | 3487.57
**Python 3** | 1438.29 | 499.47 | 1660.61 | 3598.36
**C++ STL** | 1218.29 | 1019.26 | 1394.01 | 3631.56
**Dart Native** | 2706.64 | 3124.48 | 54.71 | 5885.83
**C# Mono** | 5894.52 | 5054.05 | 280.13 | 11228.70
""".strip()

df = pd.read_table(
    StringIO(results),
    sep="|",
    header=None,
    index_col=None,
    skipinitialspace=True,
    names=["Language", "Email", "URI", "IP", "Total"],
).sort_values("Total")
df["Language"] = df["Language"].str.replace("*", "")
df = df.drop(columns="Total")

fig = px.bar(df.set_index("Language"))

app.layout = html.Div(children=[dcc.Graph(id="benchmark-bar-graph", figure=fig)])

if __name__ == "__main__":
    app.run_server(debug=True)
