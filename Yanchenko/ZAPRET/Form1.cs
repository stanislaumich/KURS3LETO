using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.AccessControl;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ZAPRET
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            openFileDialog1.FileName = "Yandex.exe";
            openFileDialog1.DefaultExt = ".exe";
            openFileDialog1.Filter = "EXE files (.exe)|*.exe";
            if (openFileDialog1.ShowDialog() == DialogResult.Cancel)
                return;
            string filename = openFileDialog1.FileName;
            textBox1.Text = Path.GetFileName(filename);

        }

        private void button4_Click(object sender, EventArgs e)
        {
            string s;
            listBox1.Items.Clear();
            for (int i = 1; i < 10; i++)
            {
                s = (string)Registry.GetValue("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\DisallowRun",
                     i.ToString(), "Empty");
                listBox1.Items.Add(s + Environment.NewLine);
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            int i;
            string s;

            i = listBox1.SelectedIndex + 1;
            textBox1.Text = i.ToString();
            Registry.SetValue("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\DisallowRun", i.ToString(), "Empty");
            listBox1.Items.Clear();
            for (int j = 1; j < 10; j++)
            {
                s = (string)Registry.GetValue("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\DisallowRun",
                     j.ToString(), "Empty");
                listBox1.Items.Add(s + Environment.NewLine);
            }
            MessageBox.Show(
        "Необходимо перезагрузить компьютер, вы помните???",
        "Сообщение",
        MessageBoxButtons.YesNo,
        MessageBoxIcon.Information,
        MessageBoxDefaultButton.Button1,
        MessageBoxOptions.DefaultDesktopOnly);

        }

        private void button2_Click(object sender, EventArgs e)
        {
            string s;
            const string userRoot = "HKEY_CURRENT_USER";
            const string subkey = "Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
            const string keyName = userRoot + "\\" + subkey;
            Registry.SetValue(keyName, "DisallowRun", listBox1.SelectedIndex + 1, RegistryValueKind.DWord);
            Registry.SetValue(keyName + "\\" + "DisallowRun", "1", textBox1.Text);
            listBox1.Items.Clear();
            for (int i = 1; i < 10; i++)
            {
                s = (string)Registry.GetValue("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\DisallowRun",
                     i.ToString(), "Empty");
                listBox1.Items.Add(s + Environment.NewLine);
            }
            MessageBox.Show(
    "Необходимо перезагрузить компьютер, вы помните???",
    "Сообщение",
    MessageBoxButtons.YesNo,
    MessageBoxIcon.Information,
    MessageBoxDefaultButton.Button1,
    MessageBoxOptions.DefaultDesktopOnly);
        }

        private void button5_Click(object sender, EventArgs e)
        {
            if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
            {
                textBox2.Text = folderBrowserDialog1.SelectedPath;
            }

        }

        private void button6_Click(object sender, EventArgs e)
        {
            try
            {
                string folderPath = textBox2.Text;
                string adminUserName = Environment.UserName;// getting your adminUserName
                DirectorySecurity ds = Directory.GetAccessControl(folderPath);
                FileSystemAccessRule fsa = new FileSystemAccessRule(adminUserName, FileSystemRights.FullControl, AccessControlType.Deny);

                ds.AddAccessRule(fsa);
                Directory.SetAccessControl(folderPath, ds);
                MessageBox.Show("Доступ к папке запрещен");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void button7_Click(object sender, EventArgs e)
        {
            try
            {
                string folderPath = textBox2.Text;
                string adminUserName = Environment.UserName;// getting your adminUserName
                DirectorySecurity ds = Directory.GetAccessControl(folderPath);
                FileSystemAccessRule fsa = new FileSystemAccessRule(adminUserName, FileSystemRights.FullControl, AccessControlType.Deny);

                ds.RemoveAccessRule(fsa);
                Directory.SetAccessControl(folderPath, ds);
                MessageBox.Show("Доступ к папке разрешен");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button8_Click(object sender, EventArgs e)
        {
            openFileDialog1.FileName = "Yandex.exe";
            if (openFileDialog1.ShowDialog() == DialogResult.Cancel)
                return;
            string filename = openFileDialog1.FileName;
            textBox3.Text = filename;
            Registry.SetValue("HKEY_CURRENT_USER\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System", "Wallpaper", textBox3.Text);

        }

        private void button9_Click(object sender, EventArgs e)
        {
            // https://ru.begin-it.com/8950-prevent-users-changing-date-time-windows-10
            
        }
    }
}
