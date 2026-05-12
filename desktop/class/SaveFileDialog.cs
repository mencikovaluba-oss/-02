using System;

namespace desktop
{
    internal class SaveFileDialog
    {
        public string Filter { get; set; }
        public string DefaultExt { get; set; }
        public string FileName { get; set; }

        internal bool ShowDialog()
        {
            throw new NotImplementedException();
        }
    }
}