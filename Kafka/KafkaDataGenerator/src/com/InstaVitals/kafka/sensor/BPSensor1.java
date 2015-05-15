package com.InstaVitals.kafka.sensor;
public class BPSensor1 implements ISensor {
	private static int minimum_bp1 = 50;
	private static int range = 60;

	@Override
	public Object sense() {
		return (int) (Math.random() * range + minimum_bp1) + ((int) (Math.random() * range + minimum_bp1) % 10);
	}

}
