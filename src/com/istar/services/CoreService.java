package com.istar.services;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import com.istar.pojo.PersonalDetails;

public class CoreService {
	private static final String DEFAULT_SEPARATOR = "&#";

	
	/**
	 * This method gets all the data and write it to csv file
	 * 
	 * @param inputValues
	 *            ArrayList value of PersonalDetails
	 * @param requiresPreviousData
	 *            boolean value
	 * @throws IOException
	 */
	public static void writePersonalDetails(List<String> inputValues, boolean requiresPreviousData) 
	throws IOException {

		
	}
/**
	 *
	 * @param personalDetails
	 * @param requiresPreviousData
	 */
	public static void writeHashsetValue(HashSet<PersonalDetails> personalDetails, boolean requiresPreviousData) 
	{

	}

	
	public static void writeHashmapStringValue(HashMap<Integer, String> mapValue, boolean requiresPreviousData)
	{

	}

	public static void writeHashmapObjectValue(HashMap<Integer, PersonalDetails> mapValue,
			boolean requiresPreviousData)
	{

	}
     /**
	 * These methods read  all the data 
	 **/
	
	public static List<PersonalDetails> readPersonalDetails() throws IOException 
	{

		
	}

	public static HashMap<Integer, PersonalDetails> readPersonalDetailsHashmapValue() throws IOException 
	{

		
	}

	public static HashSet<PersonalDetails> readPersonalDetailsHashSetValue() throws IOException 
	{


	}
/**
	 * This method for deleteing  the records  from file
	 **/
	public static void deletePersonalDetails(boolean requiresPreviousData) throws IOException 
	{

    }
	
}
