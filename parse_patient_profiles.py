# %%
import os
import textwrap


patient_profile_file = './dataset-origin/患者资料.txt'
patient_profile_txt = open(patient_profile_file).read()
patient_profiles = patient_profile_txt.split("\n\n\n")
patient_profiles = [patient_profile.strip() for patient_profile in patient_profiles if patient_profile.strip()]
# %%
TARGET_DIR = 'dataset/患者资料'
os.makedirs(TARGET_DIR, exist_ok=True)
for i, patient_profile in enumerate(patient_profiles):
    with open(os.path.join(TARGET_DIR, f"患者{i+1}.md"), '+w') as file:
        file.write(textwrap.dedent(f"""# {i+1}

{patient_profile}
"""))

# %%
