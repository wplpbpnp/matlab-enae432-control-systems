# MATLAB ENAE432 Control Systems

MATLAB scripts, data files, and generated outputs for ENAE432 control systems coursework.

## Course Summary (Testudo)

ENAE432 (`Control of Aerospace Systems`) covers analysis and design of feedback control systems in aerospace applications, including root-locus and frequency-response methods and compensation techniques.

Testudo: `https://app.testudo.umd.edu/soc/search?courseId=ENAE432&sectionId=&termId=202508`

## Project Context

The course project in this repository is landing a simulated Falcon 9 booster on a moving barge with wind.

## Contents

- Problem sets (`ps2.m` to `ps11.m`)
- Main course/project-related script (`control.m`)
- Input/output data (`*.mat`, `tabledata2.txt`)
- Supporting binaries (`landsim.p`, `nichols432.p`)
- Plots/images (`bodeG.png`, `nicholsL.png`)
- Published outputs in `html/`

## Getting Started (MATLAB)

1. Open MATLAB in the repo root.
2. Review `control.m` first (stateful controller function with persistent matrices/gains), then the problem-set scripts (`ps*.m`) for course progression.
3. Keep the provided `.mat` input/result files in the repo root so scripts can resolve them by relative path.
4. If a script depends on provided P-code helpers, keep `landsim.p` and `nichols432.p` in the same folder.
5. Compare script outputs with the published PDFs in `html/` and image files (`bodeG.png`, `nicholsL.png`).

## Dependencies

- These scripts use MATLAB Control System functionality for frequency-response and controller-analysis workflows.
- `landsim.p` and `nichols432.p` are preserved P-code dependencies used by some coursework workflows.
- `control.m` uses persistent state, so use `clear control` between runs if you want to reset the internal state in the same MATLAB session.

## Highlighted Files

- `control.m`
- `ps8.m` to `ps11.m` (advanced later-course work)
- `html/ps10.pdf`
- `html/ps11.pdf`
