"""ETL service - data processing helpers"""
import pandas as pd
from utils import clean_dataframe, summarize_dataframe


class ProcessedData:
    """Container for processed data with summary and statistics."""
    
    def __init__(self, dataframe: pd.DataFrame):
        self.dataframe = dataframe
        self.summary = summarize_dataframe(dataframe)
        from utils import calculate_statistics
        self.statistics = calculate_statistics(dataframe)


def process_upload_file(filepath: str) -> ProcessedData:
    """Process an uploaded CSV file."""
    df = pd.read_csv(filepath)
    df = clean_dataframe(df)
    return ProcessedData(df)
