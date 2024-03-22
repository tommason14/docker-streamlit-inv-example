import streamlit as st
import subprocess

st.header('Example of running a pyinvoke task via streamlit')
parameter = st.text_input("Parameter to include")
clicked = st.checkbox("Run example script")
if clicked:
    result = subprocess.run(
        f"cd test-inv && inv example --parameter {parameter}",
        shell=True,
        capture_output=True,
    )
    st.subheader('Output of command')
    st.text(result.stdout.decode("utf-8").strip())
