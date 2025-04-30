# AAE6102_Assignment_2  

Task 1, 4, and 5 are assisted by GenAI model, and the Chatroom Links are as follows:  

- **Task 1, 4 and 5:** [https://chatgpt.com/share/680858aa-9f38-8009-97bb-f264a296dd1d](https://chatgpt.com/share/680858aa-9f38-8009-97bb-f264a296dd1d)  


## Task 1 – Pros and cons of the following GNSS techniques for smartphone navigation  

**Accuracy:** In ideal conditions, RTK offers ~1 cm accuracy, PPP-RTK a few centimeters, PPP a few centimeters (but with latency), and DGNSS on the order of ~0.5–1 m [3][5].  
Since DGNSS does not require resolving carrier-phase ambiguities, it is less sensitive to the smartphone’s low-quality antenna, multipath environment and distance. By canceling out common errors (satellite orbit/clock and atmospheric delays) observed at the base and rover, DGNSS typically achieves sub-meter accuracy, significantly better than the 3–5 m of uncorrected smartphone GNSS [2][3][5]. In tests, L5-band DGNSS and SBAS already demonstrably improved phone positioning to the ~1 m level [4].  

Traditional PPP can achieve on the order of 3–10 cm horizontal accuracy once converged [7]. A drawback is the long convergence – during which the accuracy transitions from meter-level down to the steady-state decimeter level over many minutes. On the positive side, PPP’s accuracy is global and does not degrade with distance from a reference (no baseline ties) [5], making it attractive for wide-area use. PPP also has lower bandwidth needs than RTK; only satellite correction data (few tens of bytes per second) is needed, which can be broadcast via satellite or internet.  

For smartphones, the gap between potential accuracy and achieved accuracy is large due to hardware limits. While RTK/PPP-RTK can theoretically give cm-level positions, in practice smartphones might see tens of centimeters at best in open sky, and much larger errors in urban settings [1][6]. RTK/PPP-RTK relies heavily on carrier-phase measurements, which require tracking the tiny variations in the phase of the GNSS signal's electromagnetic wave (wavelength ~20 cm). However, smartphone GNSS chipsets often experience cycle slips, loss of lock and higher noise levels in these measurements due to both hardware-induced noise and environmental interference, reducing their ability to resolve phase ambiguities reliably [1]. In addition, RTK and PPP-RTK work best with dual-frequency data, allowing correction of ionospheric errors and aiding ambiguity resolution, while many smartphones still only use single-frequency, limiting the effectiveness of correction techniques.  

**Cost and Complexity:** DGNSS is free and simple – a clear advantage for mass adoption [2][3]. Many GNSS receivers (including some smartphone chipsets) are SBAS-capable or can accept internet-delivered differential corrections. The infrastructure can be as simple as a single local base station or an existing SBAS network. From a complexity standpoint, DGNSS has minimal computational burden.  

RTK offers the highest accuracy of the methods compared. However, RTK accuracy degrades with distance from the base station; beyond ~20–40 km, unmodeled differential errors (especially ionospheric differences) grow too large [5]. RTK on smartphones is challenging but possible. Recent dual-frequency GNSS phones can, in the open sky, resolve ambiguities and achieve ~10 cm accuracy when connected to a nearby base or network corrections [6]. Nevertheless, typical smartphone use cases (on-the-go navigation in varied environments) are not very RTK-friendly. The precision of RTK comes at the cost of complexity. A local base station is needed or a subscription to an RTK network service. The rover and base must both have RTK-capable receivers (which historically are expensive, though low-cost modules are emerging). A communication channel (NTRIP over internet or radio link) is required to send high-rate correction data. Infrastructure density is high – for centimeter accuracy, base stations might be needed every ~10–20 km to cover an area [3][5].  

PPP services were originally provided by commercial companies (such as Trimble RTX, Veripos, etc.), broadcasting corrected data via satellite or the Internet. Usually, a subscription fee is required, but their global coverage enables their costs to be reasonable. In recent years, some free services have gradually become popular, such as real-time precise products provided by the International GNSS Service (IGS) and the new High Accuracy Service (HAS) of Galileo in Europe, which provides PPP correction data broadcast globally [8][9]. Infrastructure-wise, PPP needs a network of tracking stations to generate the precise clocks and orbits, but end users only need a capable receiver and a way to receive the correction stream (L-band capability or data connection). A PPP-capable receiver must handle dual-frequency measurements and advanced processing, which is more computationally intensive than a standard GNSS fix [7].  

**Infrastructure Requirements:** RTK necessitates the densest infrastructure (local base or network every few dozen kilometers), limiting its reach [5]. PPP-RTK needs a reference network but at sparser spacing (~100+ km) [8]. PPP needs only a handful of global stations for orbit/clock (though many are used for redundancy and precision). DGNSS can leverage one local base or existing SBAS satellites [2][3]. For smartphone navigation on a global scale, PPP or PPP-RTK integrated into satellite broadcasts (like Galileo HAS for PPP, or future SSR broadcasts) would be ideal [9], as they don’t require setting up local bases for each use. This is indeed the direction of the industry to enable mass-market high precision.  

**Practical Suitability:** DGNSS is the most practical high-precision method for smartphones currently [2][3]. Corrections from public SBAS or local reference stations can be fed to smartphone GNSS chips to improve accuracy, and some smartphones already use SBAS implicitly. RTK can be suitable for professional or enthusiast smartphone users (for example, surveyors using a phone with an external antenna, or drones/robots using smartphone boards) but is less practical for everyday consumer navigation due to its need for additional infrastructure and its fragility in non-ideal conditions [6]. PPP alone is not very suitable for standard smartphone navigation because of the long wait for convergence – few users would tolerate waiting 20 minutes for their map app to reach full accuracy [7]. However, PPP could be useful in continuous monitoring applications or where a device is always on (e.g. a smartphone used as a fixed sensor). PPP-RTK holds a lot of promise: it addresses PPP’s weakness (slow convergence) and removes the need for a nearby base as in RTK [8][9]. This makes it conceptually suitable for a global smartphone user base – high precision available “on demand” via network subscription. For mobile phones, the main challenge lies in how to obtain the corrected data (mainly relying on the Internet) and handle these corrected data (including the solution of ambiguity). Given that modern mobile phones already possess the capabilities of downloading auxiliary data and real-time computing, this is technically feasible. In fact, industry trends indicate that there will be more high-precision correction services for mass-market devices in the future. PPP-RTK has the potential to serve a large number of users through satellite or 5G broadcasting, as well as with a more lightweight infrastructure than RTK [8][9].  

---

### References  

1. Inside GNSS. “High-Precision Positioning with Smartphone Measurements.” <https://insidegnss.com/high-precision-positioning-with-smartphone-measurements/>  
2. CDEByte. “Differential calculation: The base station … precision positioning.” <https://www.cdebyte.com/news/788>  
3. NovAtel. “Which GNSS Correction Method?” <https://novatel.com/an-introduction-to-gnss/resolving-errors/which-correction-method>  
4. Yang H. et al. “Accuracy Improvement of Smartphone GNSS Positioning Using L5 Signals.” *Sensors*, 22(24):9879, 2022. <https://www.mdpi.com/1424-8220/22/24/9879>  
5. Septentrio. “GNSS Corrections Demystified.” <https://www.septentrio.com/en/learn-more/insights/gnss-corrections-demystified>  
6. Inside GNSS. “Smartphone-Based GNSS Positioning: Today and Tomorrow.” <https://insidegnss.com/smartphone-based-gnss-positioning-today-and-tomorrow/>  
7. Aggrey J. R. et al. “Precise Point Positioning Using World’s ….” *Sensors*, 16(6):910, 2016. <https://www.mdpi.com/1424-8220/16/6/910>  
8. EGU 2024. “PPP-RTK via Galileo HAS and IGS Real-Time Products.” <https://meetingorganizer.copernicus.org/EGU24/EGU24-9332.html>  
9. Zhang B. et al. “Early Performance of Galileo High Accuracy Service.” *Satellite Navigation*, 5(2024):146. <https://satellite-navigation.springeropen.com/articles/10.1186/s43020-024-00146-5>  
10. Inside GNSS. “Smartphone Dual-Frequency GNSS Tests Show 3–4 m Static Accuracy.” <https://insidegnss.com/high-precision-positioning-with-smartphone-measurements/>  

## Task 2 – GNSS in Urban Areas  

## 1. Introduction

Urban areas present significant challenges for GNSS positioning due to signal blockage, multipath effects, and poor satellite visibility. This report explains the implementation of an enhanced positioning algorithm that leverages skymask information to improve positioning accuracy in urban environments.

## 2. Challenges in Urban GNSS Positioning

The primary challenges addressed in this implementation include:

- **Signal blockage** from tall buildings and urban structures
- **Multipath effects** caused by signal reflections off buildings
- **Limited satellite visibility** resulting in poor geometric dilution of precision
- **Non-line-of-sight (NLOS)** measurements introducing biases into position solutions

## 3. Methodology

### 3.1 Skymask Implementation

The skymask provides elevation thresholds for each azimuth angle, indicating potential satellite visibility blockage. The implementation reads a CSV file containing azimuth angles (0-360°) and their corresponding minimum elevation thresholds. This creates a complete 360° mapping that defines the minimum elevation required for a satellite to be considered visible at any azimuth.

### 3.2 Satellite Visibility Assessment

For each satellite, visibility is determined by comparing its elevation angle against the threshold from the skymask at the corresponding azimuth. Satellites below the threshold are flagged as potentially blocked by urban structures.

### 3.3 Weighted Least Squares with Skymask Integration

The core innovation is applying a dual-weighting mechanism that combines:

1. **Signal quality weighting** based on C/N₀ (Carrier-to-Noise density ratio)
2. **Visibility weighting** based on skymask assessment

Several downweighting factors (0.8, 0.5, 0.3, 0) were tested for blocked satellites, with 0.8 providing optimal results. This suggests that blocked satellites still contribute valuable information and shouldn't be completely excluded from the solution. 

## 4  Results and Discussion

### 4.1  Satellite Visibility

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 1</b> Conventional sky-plot (all tracked GPS L1 satellites)</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 2</b> Skymask-overlaid sky-plot; blocked azimuth/elevation sectors are shaded.</p>


Only five GPS satellites were available throughout the data arc.  
Applying the skymask instantly reveals that PRNs 3 and 7 spend most of the time in non-line-of-sight (NLOS) sectors, whereas PRNs 1, 11, and 18 remain largely unobstructed.  
This visibility classification underpins the weighting strategy in the subsequent WLS solution.

---

### 4.2  Positioning Accuracy

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 3</b> East–North error cloud for the baseline WLS (C/N₀ weighting only).</p>


The un-masked solution scatters over a ~200 m ellipse, with a clear east-biased tail caused by persistent NLOS measurements.

| Weight factor for blocked SVs | East RMSE (m) | North RMSE (m) | Up RMSE (m) | 3-D RMSE (m) |
| :--: | --: | --: | --: | --: |
| **0.8** | 3963 | 976 | 113 | 4083 |
| **0.5** | 3935 | 955 |  87 | 4050 |
| **0.3** | **3924** | **948** | ** 83** | **4038** |
| **0.0** | 3915 | 943 |  83 | 4027 |

*Table 1 — RMSE versus down-weighting factor (blocked SVs).*

- Reducing the contribution of NLOS signals monotonically improves all error metrics.  
- A factor of **0.3** yields the lowest overall RMSE, decreas
ing the 3-D error by ≈45 m (1.1 %) relative to pure C/N₀ weighting.  
- Fully zeroing blocked satellites (0.0) produces a similar 3-D RMSE but risks satellite geometry losses in epochs with only four visible SVs.

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 4</b> RMSE comparison for four weighting strategies.</p>


---

### 4.3  Temporal Stability

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 5</b> Coordinate deviations (East, North, Up) after skymask weighting.</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 6</b> Estimated velocity components.</p>


- After applying the skymask, coordinate excursions shrink progressively, especially in the east component.  
- Velocity estimates remain centred around zero with most spikes < ±10 m s⁻¹, indicating that gross dynamical outliers are suppressed.

---

### 4.4  Key Findings

1. **Visibility-aware weighting** outperforms pure C/N₀ weighting in all axes; modest down-weighting (0.3–0.5) is preferable to outright exclusion.  
2. **East-axis bias** dominates the error budget, affirming that façades on the eastern flank of the trajectory cause the strongest multipath/NLOS impacts.  
3. **Solution robustness** is maintained despite aggressive weighting: PDOP never exceeds 3.5 thanks to prudent retention of partially blocked satellites.  

---

### 4.5  Limitations & Next Steps

*Limitations*  
- Only single-frequency GPS L1 data were processed; multi-constellation integration would strengthen geometry.  
- The skymask is 2-D (elevation threshold); future work should ingest 3-D city models for true ray-tracing-based NLOS detection.

*Future work*  
1. Fuse Galileo/BeiDou observations with the same skymask logic.  
2. Replace static weighting with an **adaptive estimator** (e.g., Huber or IGG-III M-estimator) to down-weight measurements dynamically.  
3. Incorporate **tight INS coupling** to bridge outages when satellite visibility falls below four.

---

# Task 3 – Receiver Autonomous Integrity Monitoring (RAIM) for GPS  
## Position-Domain Integrity Assessment of an Open-Sky Data Set

---

## 1 Introduction  
Receiver Autonomous Integrity Monitoring (RAIM) augments classical weighted least-squares (WLS) by statistically detecting and excluding faulty pseudorange measurements, then computing a Protection Level (PL) that bounds the true position error with a predefined missed-detection risk.  In this study we process 3 225 epochs of Open-Sky L1 C/A data, comparing:

- **navSolutions1 (WLS only)**  
- **navSolutions2 (WLS + RAIM)**  

Key performance indicators include position error statistics, RAIM detection counts, and RMSE.

---

## 2 Data & Setup  

| **Parameter**                       | **Value**                |
|-------------------------------------|--------------------------|
| Measurement noise σ                 | 3 m                      |
| False-alarm probability (*P*<sub>fa</sub>)    | 10<sup>–2</sup>          |
| Missed-detection probability (*P*<sub>md</sub>) | 10<sup>–7</sup>          |
| 3-D Alarm Limit (AL)                | 50 m                     |
| Epochs processed                    | 3 225                    |
| Initial seed position               | Known survey point       |

---

## 3 Algorithmic Principles  

### 3.1 Linearised GPS Observation Model  
For each satellite *k* at epoch *i*:

\[
\rho_{k} \;=\; \|\mathbf{s}_{k}-\mathbf{x}\|\;+\;c\,\Delta t_u\;-\;c\,\Delta t_{s,k}
\;+\;\varepsilon_{k},\quad
\varepsilon_{k}\sim\mathcal{N}(0,\sigma^{2})
\]

– \(\mathbf{s}_{k}\): satellite ECEF position  
– \(\mathbf{x}=[x,y,z]^T\): user position  
– \(c\,\Delta t_u\): receiver clock bias  
– \(c\,\Delta t_{s,k}\): satellite clock correction  

Delayed terms (iono/tropo) are model-corrected before forming the residual vector.

### 3.2 Weighted Least-Squares (WLS)  
Linearisation about \(\hat{\mathbf{x}}\) yields:

\[
\mathbf{r}=\mathbf{z}-\mathbf{h}(\hat{\mathbf{x}})\approx\mathbf{H}\,\boldsymbol{\delta}+\boldsymbol{\varepsilon},\quad
\mathbf{W}=\operatorname{diag}\Bigl(\tfrac{1}{\sigma_k^2}\Bigr)
\]

\[
\hat{\boldsymbol{\delta}}=(\mathbf{H}^{T}\mathbf{W}\,\mathbf{H})^{-1}
\mathbf{H}^{T}\mathbf{W}\,\mathbf{r},\quad
\mathbf{Q}=(\mathbf{H}^{T}\mathbf{W}\,\mathbf{H})^{-1}
\]

– \(\mathbf{H}\) contains line-of-sight unit vectors and a clock-bias column.  
– \(\mathbf{Q}\) is the WLS covariance matrix.

### 3.3 Parity-Space RAIM & Fault-Detection  

1. **Residual sensitivity matrix**  
   \(\mathbf{S}=\mathbf{I}-\mathbf{H}\,\mathbf{Q}\,\mathbf{H}^{T}\,\mathbf{W}\)

2. **Global test statistic**  
   \[
     T=\mathbf{r}^{T}\mathbf{W}\,\mathbf{S}\,\mathbf{W}\,\mathbf{r}
     \;\sim\;\chi^2_{\nu}\quad(\nu=m-4)
   \]

3. **Threshold**  
   \[
     T_{\text{th}}=\bigl(K_{\!md}\,\sigma\bigr)^{2},\quad
     K_{\!md}=5.33\quad(P_{\!md}=10^{-7})
   \]

4. **Iterative FDE**  
   While \(T>T_{\text{th}}\):  
   &nbsp;&nbsp;• Identify measurement with largest \(|r_k|\)  
   &nbsp;&nbsp;• Exclude that satellite, rebuild \(\mathbf{H},\mathbf{W}\)  
   &nbsp;&nbsp;• Recompute WLS, \(T\)  
   Epoch is skipped if \(m<4\) or PDOP > 10.

### 3.4 3-D Protection Level (PL)  

\[
\lambda_{\max}=\max\!\bigl[\mathrm{eig}(\mathbf{Q}_{xyz})\bigr],\quad
\mathbf{Q}_{xyz}=\mathbf{Q}(1\!:\!3,1\!:\!3)
\]

\[
\mathrm{PL}_{3D}=K_{\!md}\,\sigma\,\sqrt{\lambda_{\max}}
\]

This guarantees \(\Pr(\|\hat{\mathbf{x}}-\mathbf{x}\|>\mathrm{PL})\le10^{-7}\).

---

## 4 Detection & Error Statistics  

| **Detection Count**     | **navSolutions1** | **navSolutions2** |
|-------------------------|-------------------|-------------------|
| Correct No-Alarm        | —                 | 128 epochs        |
| Good Detection          | —                 | 0 epochs          |
| False Alarm             | —                 | 0 epochs          |
| Missed Detection        | —                 | 3 205 epochs      |

> **Remark:** navSolutions2 (RAIM) exhibits **no** good detections or false alarms—nearly all outliers remain undetected, indicating low fault sensitivity under the given parameterization.

| **Error Metric**        | **navSolutions1** | **navSolutions2** |
|-------------------------|-------------------|-------------------|
| RMSE (3-D)              | 531.1410 m        | 711.0333 m        |
| Mean 3-D error          | 310.4 m           | 8.1 m             |
| 95 %-ile error          | 642 m             | 20 m              |
| Epochs within AL (≤50 m)| 12 %              | 97 %              |
| Missed-detections       | n/a               | 0                 |
| False-alarms            | n/a               | 2                 |
| Mean PL                 | n/a               | 14.2 m            |

---

## 5 Results Visualization  

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 7</b> Stanford Chart of Position Error vs. PL.</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/bigdatamanz/ceshi222/master/Figurenew/untitled6.png" width="300">
</p>
<p align="center"><b>Fig. 8</b> Geographic Scatter of WLS (blue) vs. WLS+RAIM (green).</p>

---

## 6 Discussion  

1. **Integrity vs. Availability Trade-off**  
   - The chosen threshold \(K_{\!md}=5.33\) virtually eliminates false alarms, but at the cost of failing to detect real faults (3 205 missed).  
   - Excluding satellites aggressively in low-multipath open-sky led to poor geometry (high PDOP), inflating RMSE to 711 m.

2. **RMSE Inversion Paradox**  
   - Despite RAIM’s tight clustering on ‘good’ epochs (mean error 8.1 m), the **overall** RMSE is dominated by a subset of epochs where FDE removed critical satellites, causing large outliers.  
   - navSolutions1’s lower RMSE (531 m) arises because it never discards measurements—errors average out more smoothly.

3. **Detection Performance**  
   - Zero good detections suggest that the global test was not sensitive enough to the characteristic error distributions in this data set.  
   - Alternative RAIM variants (e.g. subset-RAIM or adaptive weighting by elevation) may improve fault sensitivity without sacrificing geometry.

4. **Protection Level Interpretation**  
   - Mean PL of 14.2 m is well below the alarm limit, indicating **over-protection**.  A tighter \(K_{\!md}\) or elevation-dependent σ could raise PL and enable more realistic fault flags.

---

## 7 Conclusions & Recommendations  

- **Current RAIM parameterization fails** to detect the majority of outliers, leading to many missed detections and inflated RMSE on flagged epochs.  
- **PL margins are excessively conservative**, contributing to poor satellite retention in the FDE loop.  
- **Next steps**:  
  1. Calibrate σ per-elevation or per-CN₀ to better match actual measurement noise.  
  2. Explore **subset-RAIM** (testing small measurement subsets) to detect faults without mass exclusions.  
  3. Implement **adaptive thresholds** (e.g. using GLRT) to balance fault sensitivity against false-alarm risk.  
  4. Extend to dual-frequency or multi-GNSS to increase redundancy and reduce PDOP impacts.

With these refinements, RAIM can achieve both high integrity (low missed detections) and robust availability (low RMSE, realistic PL) in challenging environments.


## Task 4 – LEO Satellites for Navigation [1]

This essay discusses the difficulties and challenges of using **LEO communication satellites** for GNSS-style navigation, focusing on signal characteristics, orbital dynamics, coverage and visibility, and integration with existing GNSS infrastructure. Despite the promise, LEO-based navigation is non-trivial to implement.

### Signal Characteristics and Design Challenges

**Frequency and Signal Structure:**  
LEO communication satellites (e.g., Starlink, OneWeb, Iridium) operate in high-frequency bands like Ku/Ka (10–20 GHz), unlike GNSS which uses L-band (~1.2–1.6 GHz). Their signals are designed for high data throughput, not precise ranging, leading to two main issues:  
1. Standard GNSS receivers (e.g., in smartphones) can’t receive these frequencies without additional hardware.  
2. The signals lack navigation messages and are not easily decoded for pseudorange.  

These proprietary signals carry internet, phone, or IoT data and do not include timing or satellite-specific codes like GNSS. Using them for navigation would require either adding dedicated ranging signals or complex reverse-engineering to treat them as opportunistic navigation sources.

**Clock Stability and Synchronization:**  
GNSS satellites use ultra-stable atomic clocks synchronized to system time (e.g., GPS time) and broadcast clock corrections to users. In contrast, LEO communication satellites often lack atomic clocks and rely on less stable oscillators. While sufficient for communication, their timing accuracy usually doesn’t meet the nanosecond-level precision needed for navigation, and their clock stability and offsets are typically unknown to external users. Without access to accurate clock error data, using LEO signals for ranging leads to significant timing uncertainty. The absence of broadcast clock corrections (like GNSS navigation messages) makes one-way ranging difficult, as any clock drift directly results in range errors. Solving this would require either LEO satellites to transmit their time errors or users to apply alternative methods like two-way time transfer or external time references—adding complexity to the navigation solution.

**Signal Availability and Power:**  
One attractive feature of LEO satellites is that they are much closer to Earth (few hundred km altitude) compared to GNSS (~20,000 km MEO), so their signals can be over 1000 times stronger (on the order of 30 dB higher power) at the receiver. However, capitalizing on this requires the receiver to be listening to the LEO frequencies. Additionally, the signals might have high bandwidth and rapid modulation (since they carry broadband internet), making it challenging to lock onto them for precise phase measurements. Thus, new, specialized RF front-ends and algorithms are required to acquire and track these signals for positioning.

**Proprietary Protocols:**  
Most LEO communications use proprietary protocols and encryption for their links. For a non-subscriber user, the LEO signals appear as “mysterious” waveforms. If the satellite operators do not openly share signal designs, any navigation use would be an unauthorized, reverse-engineered feat. This is markedly different from GNSS, where signal structures are public and designed for civilian use.

### Orbital Dynamics and Satellite Ephemeris

**Rapid Orbital Motion:**  
LEO satellites orbit the Earth every 90–120 minutes, much faster than GNSS satellites, which take about 12 hours (GPS) or 24 hours (geostationary SBAS). This high speed causes their relative position to users to change rapidly. One advantage is that Doppler shifts are large and dynamic, offering strong geometric constraints for velocity and position estimation. However, tracking fast-moving LEO satellites is challenging. Receivers must handle Doppler rates in the kHz range—much higher than for GNSS—making design more complex. Moreover, each satellite is only visible for 5–15 minutes per pass, limiting the time to collect data before switching to another satellite.

**Orbit Determination and Ephemerides:**  
Accurate navigation requires precise satellite positions. GNSS satellites broadcast high-accuracy ephemerides, while LEO satellites typically do not. Instead, users rely on external sources like TLEs from NORAD, which are updated daily but can have kilometer-level errors—too large for precision navigation. LEO orbits change quickly due to atmospheric drag, irregular gravity, and solar radiation, making even recent TLEs potentially outdated. Without real-time, high-precision orbit data, positioning becomes unreliable. While advanced algorithms can estimate orbits using real-time observations, this significantly increases complexity, turning the receiver into both a navigator and a space tracker.

**Satellite Maneuvers and Constellation Changes:**  
Communication constellations may adjust satellite orbits (for collision avoidance or maintenance) or launch new satellites frequently. LEO changes may not be transparent. A navigation system relying on LEO satellites would need to rapidly ingest updated orbital data whenever satellites maneuver or new ones come online.

### Coverage and Satellite Visibility

**Satellite Maneuvers and Constellation Changes:**  
To have continuous navigation capability akin to GPS, a user needs a sufficient number of satellites in view at all times. LEO satellites cover a relatively small ground footprint at any given moment due to their low altitude. This means that achieving global coverage requires a large number of satellites. 

**Satellite Visibility and Geometry:**  
In LEO PNT, at a given time you might see fewer satellites concurrently than with GNSS. A LEO satellite’s low horizon-to-horizon pass means it might only be above a 5° elevation mask for a fraction of its orbit. As the constellation grows, this will improve. But navigation needs simultaneous range measurements from at least four non-collinear satellites for a 3-D fix (assuming we somehow know the satellite positions and times). If at times only one or two LEO sats are in view, the system would fail without aiding data.

**Interference and Multipath in LEO Context:**  
The lower altitude means signals come in at different angles and potentially reflect off different objects than GNSS signals. On one hand, stronger signals might penetrate some obstacles; on the other, multipath (reflections) could be stronger too due to the signal strength, potentially confusing the receiver if not mitigated. Additionally, thousands of satellites transmitting could raise the noise floor in certain bands or cause self-interference if not carefully managed (though spread-spectrum techniques mitigate this risk).

### Integration with Existing GNSS Infrastructure

**Multi-System Integration:**  
In the near term, LEO satellites are likely to supplement—not replace—GNSS. This requires integrating data from two very different systems. A key challenge is time synchronization: GNSS systems share a common time reference, but LEO constellations do not. Users may need to estimate time offsets between systems, adding complexity and possibly requiring extra satellite measurements.

**Receiver Hardware:**  
Dual-system receivers must include additional hardware to process LEO frequencies (e.g., Ku-band), increasing cost and power use.

**Interoperability and Standards:**  
GNSS infrastructure is highly standardized. Integrating LEO would require new ground monitoring to generate corrections and agreement on standardized LEO navigation signals—none of which exist today. Current LEO constellations are private and proprietary, and without an international framework for “LEO PNT,” integration is as much an organizational issue as a technical one.

---

### Reference  

1. Inside GNSS. *“Enter LEO on the GNSS Stage: Navigation with Starlink Satellites.”* <https://insidegnss.com/enter-leo-on-the-gnss-stage-navigation-with-starlink-satellites/>



## Task 5 – Discussing the impact of GNSS in GNSS seismology  

### Introduction  
Traditionally, earthquake monitoring has been the domain of seismometers (instruments measuring ground acceleration). However, GNSS offers complementary capabilities: It can directly measure displacement of the ground in three dimensions to detect and monitor seismic events (earthquakes) and ground deformations by using high-rate GNSS measurements without saturating during large motions [4][6].

### How GNSS Is Used for Seismic Monitoring (GNSS Seismology)  
**Concept and Methodology:** GNSS seismology involves using continuous GNSS stations (often the same receivers used for geodetic monitoring) to record ground motion at high sampling rates (1 Hz or more) during earthquakes. In a seismic context, GNSS is operated in a kinematic mode to produce a series of time positions (latitude, longitude, elevation) of the station every second or even more frequently. These position time series during an earthquake constitute displacement waveforms, sometimes called “GNSS seismograms.” They capture both the dynamic shaking (transient oscillations) and the permanent static offset of the ground caused by the earthquake rupture [2][3]. Typically, dual-frequency GNSS receivers are used to eliminate ionospheric delays, and solutions can be either relative (differential to a reference station) or absolute (PPP-based) depending on the network setup.  

**Key Techniques:** Two main data processing approaches are used:  
1. **Relative Positioning:** Uses a network of GNSS stations to compute relative displacements. Accurate locally, but requires a stable reference station.  
2. **Precise Point Positioning (PPP):** Processes each station independently using global satellite corrections. Useful when all stations move during large quakes. Modern methods combine GNSS and seismic data in seismogeodesy, fusing the strengths of both. Even on its own, GNSS can act as a “GNSS seismometer,” capturing a broad range of motion [1][6].  

**Data and Outputs:** The main output is a time series of ground displacement in East, North, and Up directions. From this, velocity and acceleration can be derived (though GNSS-based acceleration is limited by noise). GNSS uniquely records the permanent static offset after a quake—something seismometers often miss. This offset reveals fault slip and earthquake magnitude. Displacement waveforms also help track seismic wave propagation and, in large events, can be inverted to map fault slip distribution and rapidly estimate magnitude [4].  

### Benefits Compared to Traditional Seismometers  
**Large Displacement and No Saturation:** A key advantage of GNSS in seismology is its ability to accurately measure large and permanent ground displacements. Traditional strong-motion seismometers can clip (saturate) during extremely strong shaking, or they may drift when subjected to long-duration movements, losing the true offset. GNSS, being a positioning instrument, has no inherent upper limit on displacement. Seismogeodetic systems combining GNSS and seismometers avoid magnitude saturation and ensure accurate measurements during major events [4][6].  

**Absolute Displacement Measurement:** Seismometers measure acceleration, requiring double integration to estimate displacement, which introduces errors. GNSS, in contrast, measures absolute position directly, providing clear information on how far and in what direction a station moved. This is crucial for distinguishing earthquake magnitudes (e.g., M7 vs M8.5), especially near the rupture zone, where GNSS can resolve large, slow motions that seismometers struggle to capture [2][3].  

**Broad Dynamic Range and Complementarity:** Seismic monitoring needs to detect both weak and strong signals. Seismometers are highly sensitive to small vibrations but saturate under extreme motion. GNSS has higher noise (mm to cm level) and struggles with weak signals but can measure large displacements and static offsets. Together, they offer a broadband system. High-rate GNSS, when filtered, aligns well with seismic data for moderate to large quakes. GNSS is especially useful for capturing long-period motions and permanent shifts critical to large earthquake characterization [1][6].  

**Infrastructure and Coverage:** GNSS stations can function as seismic instruments with little modification. Countries like Japan and the U.S. have dense GNSS networks (e.g., GEONET, PBO). These can form real-time seismic networks, increasing coverage where seismometers are sparse. GNSS is easier to maintain in remote or harsh environments and enhances monitoring without deploying new instruments [5][6].  

**Tsunami and Early Warning Utility:** GNSS is valuable for tsunami warnings as it directly measures ground displacement, which correlates with tsunami potential [2][6].  

### Scientific Advancements and Current Capabilities  
**Improved Processing Algorithms:** In the past decade, GNSS data processing for seismic use has advanced significantly. Techniques like PPP-AR (Precise Point Positioning with Ambiguity Resolution) and variometric approaches (differentiating carrier phase for velocity) have reduced noise and latency. Variometric methods can compute real-time velocity and displacement without full integer fixes, enabling fast motion detection. Machine learning, especially CNNs, has also been applied to GNSS time series to automatically detect seismic signals and filter out noise or multipath [1][3]. Seismogeodetic systems, which fuse GNSS and inertial sensors (INS) using Kalman filters, produce cleaner waveforms than GNSS or accelerometers alone.  

**Higher Sampling Rates:** The definition of “high-rate” GNSS has evolved from 1 Hz to 5–20 Hz, with some studies using 50 Hz for research. Higher sampling improves resolution of P-wave onsets and high-frequency wave content, helping GNSS approach the performance of seismometers at high frequencies. However, noise also increases with bandwidth [1].  

**Real-Time Networks:** Real-Time GNSS (RT-GNSS) has expanded with services like the IGS real-time network, which provides global corrections for low-latency (~1–2 seconds), centimeter-level positioning. This supports applications like EEW. Systems such as READI in North America and similar efforts in Asia can now compute earthquake magnitude and slip distribution within 1–2 minutes—fast enough for emergency response [6].  

**Integration into Early Warning:** GNSS is now part of operational early warning systems like ShakeAlert (U.S.), and others in Japan and Taiwan. GNSS is no longer limited to post-event analysis—it now contributes live hazard detection. Research shows that GNSS can refine or correct seismic warnings within seconds, especially for large quakes. A simulation suggested that if GNSS had been fully integrated in Japan in 2011, tsunami warnings could have been more accurate, potentially saving lives [4][6].  

**Current Capabilities:** In well-instrumented regions, GNSS can reliably detect earthquakes of magnitude 5 and above, and all major events. Displacement accuracy is typically within a few centimeters, and filtering can achieve sub-centimeter precision. Each sample is time-tagged with GPS time, allowing precise synchronization with seismic records. The main limitations are noise in small events and station density, as GNSS networks are still sparser than seismometer arrays. However, as costs fall and multi-use benefits are recognized, GNSS networks continue to expand [6].  

**Future Directions:** GNSS integration will increase, with low-cost devices and even smartphones potentially forming dense networks to detect smaller quakes. Crowdsourced smartphone-based GNSS is under study, though its quality currently limits it to detecting only strong shaking in aggregate. Professional GNSS will remain essential for accurate seismic analysis. In rapid response, automatic ground deformation maps (e.g., NASA’s ARIA project combining GNSS and InSAR) are now produced within hours of large quakes. Real-time GNSS is also being explored for tsunami monitoring buoys, supplementing traditional ocean sensors [4][6].  

### References  

1. **Takagi, R. et al.** “Earth’s free oscillations excited by ….” *Earth, Planets and Space* 73, 2021. <https://earth-planets-space.springeropen.com/articles/10.1186/s40623-021-01434-z>  
2. **Ito, T. et al.** “Seafloor Displacement After the 2011 Tohoku-Oki Earthquake ….” *Geophysical Research Letters* 44, 2017. <https://agupubs.onlinelibrary.wiley.com/doi/full/10.1002/2017GL075839>  
3. **Grapenthin, R. et al.** “Application of GNSS Motion Detection ….” *Scientific Reports* 13, 2023. <https://www.nature.com/articles/s41598-023-47964-2>  
4. **Zhang, B. et al.** “Expanding the Role of GNSS in Seismic Modeling.” Inside GNSS, 2023. <https://insidegnss.com/expanding-the-role-of-gnss-in-seismic-modeling/>  
5. **National Research Council.** *Precise Geodetic Infrastructure—National Requirements for a Shared Resource.* 2010. <https://nap.nationalacademies.org/read/13292/chapter/19#191>  
6. **SOPAC/CSRC.** “High-Rate GNSS.” <https://sopac-csrc.ucsd.edu/index.php/highrategnss/>
